var Speed_test = {
    sock: null,
    ip: "10.0.4.152",
    port: "8082",
    pingTime: 0,
    pingTimes: 0,
    startTime: 0,
    roundTripTime: 0,
    spentTime: 0,
    mbps: 0,
    error: 0,
    accept_total_bytes: 0,    // 接收到的总数据字节
    send_total_bytes: 2048000, // 发送的总数据字节
    progress: 0,              // 测速进度
    reconnectTimes: 0,
    speedtest_mode: 1,//默认延迟带宽都测
    region_id: 0,//线路id
    start: function () {
        console.log(this.sock);
        if (this.sock) {
            this.sock.close();
            //  中断连接时.还原所有的属性
            this.resetAll();
        }

        var c = this;
        // Connect to GMC
        try {
            this.sock = new WebSocket("ws://" + c.ip + ":" + c.port + "/ws");
        } catch (err) {
            c.onError();
            console.log("Error: " + err + "\n");
        }
        //this.sock = new WebSocket("ws://" + c.ip + ":" + c.port + "/ws");
        this.sock.binaryType = "arraybuffer"; // We are talking binary

        this.sock.onopen = function () {
            console.log("Connected to " + c.ip + ":" + c.port + ". " + c.reconnectTimes + " times.\n");
            c.pingTime = Date.now();
            c.pingTimes++;
            c.sock.send("ping");
        };
        this.sock.onclose = function () {
            c.reconnectTimes++;
            console.log("Disconnected from " + c.ip + ":" + c.port + ". " + c.reconnectTimes + " times.\n");

            //  中断连接时.还原所有的属性
            c.resetAll();
        };
        this.sock.onerror = function () {
            c.error = 1;
            c.onError();
        },
            this.sock.onmessage = function (evt) {
                c.onMessage(evt);
            };
    },
    resetAll: function () {
        this.pingTime = 0;
        this.pingTimes = 0;
        this.startTime = 0;
        this.roundTripTime = 0;
        this.spentTime = 0;
        this.mbps = 0;
        this.accept_total_bytes = 0;    // 接收到的总数据字节
        this.send_total_bytes = 2048000; // 发送的总数据字节
        this.progress = 0;              // 测速进度
        this.reconnectTimes = 0;
    },
    //连接出错
    onError: function () {
        console.log("connect fail \n");
    },
    /*
     返回测速结果
     */
    onSpeedtest: function (msg) {
        console.log("onSpeedtest: json_data:" + JSON.stringify(msg) + "\n");
        var delay_time = parseInt(msg.delayTime);
        var region_id = msg.region_id;
        $('#delay_time_' + region_id).text(delay_time);
        modify_class_by_speed(region_id, delay_time, null);
        //测速结果存储到本地
        var region_data = store.get('region_data');
        var is_exist = false;
        if (region_data != undefined) {
            var myobj = eval(region_data);
            for (var i = 0; i < myobj.length; i++) {
                if (myobj[i].region_id == region_id) {
                    is_exist = true;
                    myobj[i].delay_time = delay_time;
                }
            }
            if (is_exist == true) {
                var jsonText = JSON.stringify(myobj);
                store.set('region_data', jsonText);
            }
            if (is_exist == false) {
                var ss = new Object();
                ss.region_id = region_id;
                ss.delay_time = delay_time;
                ss.mbps = 0;
                myobj.push(ss);
                var jsonText = JSON.stringify(myobj);
                store.set('region_data', jsonText);
            }

        } else {
            var cc = [{"region_id": region_id, "delay_time": delay_time, "mbps": 0}];
            store.set('region_data', cc);
        }
        //汇报测速结果到服务器
        notice_speed_result(region_id, delay_time, 0);
    },
    onMessage: function (evt) {
        try {
            if (typeof(evt.data) == "string") {
                this.roundTripTime += Date.now() - this.pingTime;
                if (this.pingTimes >= 3) {
                    if (this.speedtest_mode != 1) {
                        var msg = {
                            'delayTime': (this.roundTripTime / 3).toFixed(2),
                            'region_id': this.region_id,
                            'mbps': null
                        };
                        this.onSpeedtest(msg);
                        this.sock.close();
                    } else {
                        this.startTime = Date.now();
                        this.sock.send("send");
                        console.log("ping finished. begin send data \n");
                    }
                } else {
                    this.pingTime = Date.now();
                    this.pingTimes++;
                    this.sock.send("ping");
                }
            } else {
                this.accept_total_bytes += evt.data.byteLength;
                this.progress = ((this.accept_total_bytes / this.send_total_bytes).toFixed(2)) * 100;
                console.log("recv: " + this.accept_total_bytes + " bytes. progress: " + this.progress + " \n");
                this.spentTime = Date.now() - this.startTime;
                if (this.progress >= 100 || this.spentTime > 8 * 1000) { // 接收数据进度100%，或者时间已经超过8秒
                    this.progress = 100;
                    this.mbps = (this.accept_total_bytes * 8 * 1000) / this.spentTime / 1024 / 1024;
                    var msg = {'delayTime': (this.roundTripTime / 3).toFixed(2), 'mbps': (this.mbps).toFixed(2)};
                    this.onSpeedtest(msg);

                    this.sock.close();
                }
            }
        } catch (err) {
            console.log("Error: " + err + "\n");
            this.sock.close();
        }
    }
};

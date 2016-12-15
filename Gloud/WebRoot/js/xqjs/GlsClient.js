var GlsClient = {
    client_ver: "20150715",
    sock: null,
    ip: "115.29.242.90",
    port: "8001",
    reconnectTimes: 0,
    auto_reconnect: false,
    connected: false,
    account_id: 0,
    device_uuid: "",
    login_token: "",
    nickname: "",
    heartbeatIntervalId: 0,
    start: function () {

        if (this.sock && this.sock.readyState == WebSocket.OPEN) {
            console.log("already connected.");
            return;
        }

        var c = this;
        // Connect to GLS
        this.sock = new WebSocket("ws://" + c.ip + ":" + c.port + "/ws");
        this.sock.binaryType = "arraybuffer"; // We are talking binary

        this.sock.onopen = function () {
            c.connected = true;
            console.log("Connected to " + c.ip + ":" + c.port + ". " + c.reconnectTimes + " times.\n");
            //c.login();
            // 每隔10秒钟一次心跳
            if (c.heartbeatIntervalId == 0) {
                c.heartbeatIntervalId = setInterval(function () {
                    if (c.connected)
                        c.heartbeat();
                }, 10000);
            }
            c.onOpen();
        };
        //连接websocket 出错
        this.sock.onerror = function () {
            console.log("connected error from " + c.ip + ":" + c.port + ". " + c.reconnectTimes + " times.\n");
            c.onError();
        },
            this.sock.onclose = function () {
                c.connected = false;
                c.reconnectTimes++;
                console.log("Disconnected from " + c.ip + ":" + c.port + ". " + c.reconnectTimes + " times.\n");
                if (c.auto_reconnect) {
                    // 不要频繁的重连，最长10秒重连一次
                    setTimeout(function () {
                        console.log("!!!!!!####!!!!!!!connect gls");
                        c.start()
                    }, Math.min(10000, c.reconnectTimes * 2000));
                }
            };

        this.sock.onmessage = function (evt) {
            c.onMessage(evt);
        };
    },
    onError: function () {

    },
    onOpen:function()
    {

    },
    /*
     message GLSLogin {
     optional int32  account_id                          = 1;    // 账户ID
     optional string device_uuid                         = 2;    // 设备UUID
     optional string login_token                         = 3;    // 设备登录Web得到的Token，GLS会找web验证
     optional string client_ver                          = 4;    // 客户端版本
     optional string nickname                            = 5;    // 昵称
     }
     */
    login: function () {
        if (!this.sock || this.sock.readyState != WebSocket.OPEN) {
            console.log("Login failed. Not connected\n");
            return;
        }
        var msg = {LinkSide: 8, MajorId: 0, MinorId: 0};
        var login = {
            account_id: parseInt(this.account_id),
            device_uuid: this.device_uuid,
            login_token: this.login_token,
            client_ver: this.client_ver,
            nickname: this.nickname
        };
        msg.Body = JSON.stringify(login);
        var str = JSON.stringify(msg);
        this.sock.send(str);
        console.log("Login Sent: " + str + "\n");
    },
    onLogin: function (msg) {
        console.log("onLogin: ret:" + msg.result + " msg:" + msg.result_msg + "\n");
    },
    onLogout: function (msg) {
        console.log("onLogout: ret:" + msg.result + " msg:" + msg.result_msg + "\n");
    },
    onKick: function (msg) {
        console.log("onKick: code:" + msg.kick_code + " reason:" + msg.kick_reason + "\n");
        // 被踢的情况下，不再自动重连
        this.auto_reconnect = false;
    },
    onNotify: function (msg) {
        console.log('onNotify_info' + JSON.stringify(msg));
        if (msg.type == 3) {
            var notify = JSON.parse(msg.notify);
            console.log("onNotify: type:" + msg.type + " notify:" + notify.toast + "\n");
        }
        else
            console.log("onNotify: type:" + msg.type + " notify:" + msg.notify + "\n");
    },
    heartbeat: function () {
        if (!this.sock || this.sock.readyState != WebSocket.OPEN) {
            console.log("heartbeat failed. Not connected\n");
            return;
        }
        var msg = {LinkSide: 8, MajorId: 0, MinorId: 4};
        var str = JSON.stringify(msg);
        this.sock.send(str);
        console.log("heartbeat Sent: " + str + "\n");
    },
    /*
     message Enqueue {
     repeated int32            region_id                   = 1;    // 区域ID
     optional int32            game_id                     = 2;    // 游戏ID
     optional int32            gamepack_id                 = 3;    // 游戏包ID
     optional GameMode         game_mode                   = 4;    // 游戏模式
     optional GamePayment      payment_type                = 5;    // 支付模式
     optional int32            save_id                     = 6;    // 存档ID
     optional int32            serial_id                   = 7;    // 存档组ID
     }
     */
    enqueue: function (region_id, game_id, game_mode, payment_type, save_id, serial_id) {
        if (!this.sock || this.sock.readyState != WebSocket.OPEN) {
            console.log("Enqueue failed. Not connected\n");
            return;
        }
        var msg = {LinkSide: 8, MajorId: 2, MinorId: 3};
        var enqueue = {
            region_id: [parseInt(region_id)],
            game_id: parseInt(game_id),
            gamepack_id: 0,
            game_mode: parseInt(game_mode),
            payment_type: parseInt(payment_type),
            save_id: parseInt(save_id),
            serial_id: parseInt(serial_id)
        };
        msg.Body = JSON.stringify(enqueue);
        var str = JSON.stringify(msg);
        this.sock.send(str);
        console.log("Enqueue Sent: " + str + "\n");
    },
    onEnqueue: function (msg) {
        console.log("onEnqueue: ret:" + msg.result + " msg:" + msg.result_msg + "\n");
    },
    /*
     message Dequeue {
     repeated int32    region_id                            = 1;    // 区域ID
     }
     */
    dequeue: function (region_id) {
        if (!this.sock || this.sock.readyState != WebSocket.OPEN) {
            console.log("Dequeue failed. Not connected\n");
            return;
        }
        var msg = {LinkSide: 8, MajorId: 2, MinorId: 4};
        var dequeue = {region_id: [parseInt(region_id)]};
        msg.Body = JSON.stringify(dequeue);
        var str = JSON.stringify(msg);
        this.sock.send(str);
        this.auto_reconnect = false;
        console.log("Dequeue Sent: " + str + "\n");
    },
    onDequeue: function (msg) {
        console.log("onDequeue: ret:" + msg.result + " msg:" + msg.result_msg + "\n");
    },
    /*
     message OneRegion {
     optional int32    region_id                            = 1;    // 区域ID
     }
     */
    oneRegion: function (region_id) {
        if (!this.sock || this.sock.readyState != WebSocket.OPEN) {
            console.log("oneRegion failed. Not connected\n");
            return;
        }
        var msg = {LinkSide: 8, MajorId: 2, MinorId: 2};
        var one = {region_id: parseInt(region_id)};
        msg.Body = JSON.stringify(one);
        var str = JSON.stringify(msg);
        this.sock.send(str);
        console.log("oneRegion Sent: " + str + "\n");
    },
    /*
     {
     "result":0,
     "result_msg":"success",
     "status":{
     "region_id":5,           // 正在排队的区域ID
     "region_name":"内网152", // 正在排队的区域名称
     "load":0,                // 在该队列中的位置
     "queue_max_size":10,     // 队列最大人数
     "queue_curr_num":1,      // 当前排队总人数
     "queue_vip_num":0,       // 当前排队的VIP人数
     "cpu_load":0,            // 区域CPU负载，百分比：0~100
     "gpu_load":0             // 区域GPU负载，百分比：0~100
     "queue_svip_num":9,      // 当前排队的SVIP人数
     },
     "top_users":[
     {
     "pos":0,                                  // 队列中的位置
     "account_id":134952,                      // 账户ID
     "nickname":"宅宅的阿贝尔",                // 账户昵称
     "level":0,                                // 账户级别
     "vip_level":0,                            // 账户VIP级别
     "queued_game_id":1,                       // 打算玩的游戏ID
     "queued_game_name":"超级街霸4：街机版",   // 打算玩的游戏名称
     "alloced":false,                          // 是否已经分配GS
     "avatar":"http://pic2.51ias.com/a.png",   // 账户头像
     "queued_game_pic":"http://1.jpg"          // 游戏标题图
     }
     ]
     }
     */
    onOneRegion: function (msg) {
        console.log("onOneRegion: " + JSON.stringify(msg) + "\n");
    },

    allRegion: function () {
        if (!this.sock || this.sock.readyState != WebSocket.OPEN) {
            console.log("allRegion failed. Not connected\n");
            return;
        }
        var msg = {LinkSide: 8, MajorId: 2, MinorId: 1};
        var str = JSON.stringify(msg);
        this.sock.send(str);
        console.log("allRegion Sent: " + str + "\n");
    },
    /*{
     "regions":[
     {
     "region_id":7,                    // 区域ID
     "region_name":"浙江联通(临时)",   // 正在排队的区域名称
     "load":0,                         // 区域负载，百分比：0~100
     "queue_max_size":5,               // 最大排队人数
     "queue_curr_num":0,               // 当前排队总人数
     "queue_vip_num":0                 // 当前排队的VIP人数
     "cpu_load":0,                     // 区域CPU负载，百分比：0~100
     "gpu_load":0                      // 区域GPU负载，百分比：0~100
     "queue_svip_num":0,               // 当前排队的SVIP人数
     },
     ]
     }
     */
    onAllRegion: function (msg) {
        console.log("onAllRegion: " + JSON.stringify(msg) + "\n");
    },

    roomList: function (region_id, game_id, available_only) {
        if (!this.sock || this.sock.readyState != WebSocket.OPEN) {
            console.log("roomList failed. Not connected\n");
            return;
        }
        var msg = {LinkSide: 8, MajorId: 3, MinorId: 0};
        var one = {
            region_id: parseInt(region_id),
            game_id: parseInt(game_id),
            available_only: (available_only === true)
        };
        msg.Body = JSON.stringify(one);
        var str = JSON.stringify(msg);
        this.sock.send(str);
        console.log("roomList Sent: " + str + "\n");
    },
    onRoomList: function (msg) {
        console.log("onRoomList: " + JSON.stringify(msg) + "\n");
    },
    joinRoom: function (room_id, pos_id) {
        if (!this.sock || this.sock.readyState != WebSocket.OPEN) {
            console.log("joinRoom failed. Not connected\n");
            return;
        }
        var msg = {LinkSide: 8, MajorId: 3, MinorId: 1};
        var one = {room_id: parseInt(room_id), pos_id: parseInt(pos_id)};
        msg.Body = JSON.stringify(one);
        var str = JSON.stringify(msg);
        this.sock.send(str);
        console.log("joinRoom Sent: " + str + "\n");
    },
    onJoinRoom: function (msg) {
        console.log("onJoinRoom: " + JSON.stringify(msg) + "\n");
    },

    /*{
     "queues":[                               // 所有正在排队的队列
     {
     "region_id":5,                           // 正在排队的区域ID
     "region_name":"内网152",                 // 正在排队的区域名称
     "pos":0,                                 // 在该队列中的位置
     "queue_curr_num":1,                      // 当前排队总人数
     "queue_vip_num":0,                       // 当前排队的VIP人数
     "queue_status":"20:06:17 移除无效用户"   // 当前排队状况
     "queue_svip_num":0,                      // 当前排队的SVIP人数
     }
     ],
     "last_queue_info":{                // 排队的游戏信息
     "region_id":[5],                   // 区域ID，数组
     "game_id":1,                       // 游戏ID
     "game_name":"超级街霸4：街机版",   // 游戏名称
     "game_mode":1,                     // 游戏模式
     "payment_type":0,                  // 支付模式
     "save_id":-1,                      // 存档ID
     "serial_id":-1                     // 存档组ID
     }
     }
     */
    onQueueStatus: function (queueList) {
        console.log("onQueueStatus: " + JSON.stringify(queueList) + "\n");
        if (queueList.queues) {
            queueList.queues.forEach(function (queue) {
                console.log(" region_id:" + queue.region_id + " region_name:" + queue.region_name +
                " pos:" + queue.pos + " queue_curr_num:" + queue.queue_curr_num + " queue_vip_num:" + queue.queue_vip_num + " queue_svip_num:" + queue.queue_svip_num +
                " queue_status:" + queue.queue_status);
            });
            console.log(" game_id:" + queueList.last_queue_info.game_id +
            " game_name:" + queueList.last_queue_info.game_name +
            " game_mode:" + queueList.last_queue_info.game_mode +
            " payment_type:" + queueList.last_queue_info.payment_type +
            " save_id:" + queueList.last_queue_info.save_id +
            " serial_id:" + queueList.last_queue_info.serial_id);
        }
    },

    /*
     message ConnectGS {
     "region_id":5,                                 // 区域ID
     "gsm_id":1,                                    // 分配GS的GSM ID
     "gs_id":5001000,                               // 要连接的GS ID
     "gs_ip":"10.0.4.152",                          // GS IP
     "gs_tcp_port":9000,                            // GS TCP 端口
     "gs_udp_port":9000,                            // GS UDP 端口
     "gsm_token":"GQUFUDDBSUFTVQKDIYRWAVBRTSWGYKLM",// 连接GS所需的GSM Token
     "is_left_over":0,                              // 是否上次残留的GS
     "vip_wait_timeout":50,                         // 请在XX秒内回报是否连接GS成功，如果成功，GLS将立刻处理后续队列；如果失败，视情况而定，GLS可能会再给一次分配新GS的机会。
     "nonvip_wait_timeout":20,                      // 请在XX秒内回报是否连接GS成功，如果成功，GLS将立刻处理后续队列；如果失败，视情况而定，GLS可能会再给一次分配新GS的机会。
     "game_id":1,                                   // 游戏ID
     "game_mode":1,                                 // 游戏模式
     "payment_type":0,                              // 支付模式
     "save_id":-1,                                  // 存档ID
     "serial_id":-1,                                // 存档组ID
     "svip_wait_timeout":120,                       // 请在xX秒内回报是否连接GS成功，如果成功，GLS将立即处理后续队列；如果失败，视情况而定，GLS可能会再给一次分配GS的机会。
     }
     */
    onConnectGS: function (msg) {
        console.log("onConnectGS: " + JSON.stringify(msg) + "\n");
        var c = this;
        // 一秒钟后通知GLS连接GS成功
        setTimeout(function () {
            c.sendConnectGSResult(0, "success", msg.region_id, msg.gs_id, 0, 0);
        }, 1000);
    },
    /*
     message ConnectGS_R {
     "region_id": 1,         // 要连接的区域ID
     "gs_id":1001001,        // 要连接的GS ID
     "result":0,             // 客户端告知GLS是否成功连接GS
     "result_msg":"success", // 成功或者失败的原因。
     "gs_return_code":0,     // 客户端连接GS时，GS返回的code。0表示成功。若此项为非0，则result必须!=0
     "gs_web_verify_code":0, // 客户端连接GS、GS找Web验证时，Web返回的code。0表示成功。若此项为非0，则result必须!=0
     }
     */
    sendConnectGSResult: function (result, result_msg, region_id, gs_id, gs_return_code, gs_web_verify_code) {
        if (!this.sock || this.sock.readyState != WebSocket.OPEN) {
            console.log("sendConnectGSResult failed. Not connected\n");
            return;
        }
        var msg = {LinkSide: 8, MajorId: 2, MinorId: 5};
        var gsret = {
            region_id: parseInt(region_id),
            gs_id: parseInt(gs_id),
            result: parseInt(result),
            result_msg: "success",
            gs_return_code: parseInt(gs_return_code),
            gs_web_verify_code: parseInt(gs_web_verify_code)
        };
        msg.Body = JSON.stringify(gsret);
        var str = JSON.stringify(msg);
        this.sock.send(str);
        console.log("sendConnectGSResult Sent: " + str + "\n");
    },
    /* 找GLS查询此账号下正在运行或者旁观的游戏，可以选择是否通知同帐号的其他设备。默认设置为false。
    message RunningGames {
    "notify_all":false,    // 是否要通知同账号的其他设备
    }
     */
    sendRunningGames: function (notify_all) {
        if (!this.sock || this.sock.readyState != WebSocket.OPEN) {
            console.log("sendRunningGames failed. Not connected\n");
            return;
        }
        var msg = {LinkSide: 8, MajorId: 2, MinorId: 6};
        var rgames = {
            notify_all: notify_all
        };
        msg.Body = JSON.stringify(rgames);
        var str = JSON.stringify(msg);
        this.sock.send(str);
        console.log("sendRunningGames Sent: " + str + "\n");
    },
    /* 此账号下正在运行或者旁观的游戏，notify_all来自RunningGames中的值。
       要么running_game非空，要么observing_game和observing_gs非空，要么三者皆空，不可能三个都存在，因为同一个账户只能同时运行或旁观一个游戏。
    message RunningGames_R {
    ”result":0,                 // 请求、验证的结果： 0表示成功，-1表示失败，其他值待定义
    ”result_msg":"success",     // 请求、验证的结果的文字信息
    ”running_game":{            // 正在玩的游戏
        // 具体内容参见ConnectGS的结构
    },
    ”observing_game":{          // 正在旁观的游戏, observing_game和observing_gs必须同时存在
        // Web暂未支持旁观，可以忽略
    },
    ”observing_gs":{            // 正在旁观的GS
        // Web暂未支持旁观，可以忽略
    },
    ”notify_all":false,    //是否要通知同账号的其他设备
    }
     */
    onRunningGames: function (msg) {
        console.log("onRunningGames: " + JSON.stringify(msg) + "\n");
    },

    onMessage: function (evt) {
        if (typeof evt.data == "string") {
            try {
                var msg = JSON.parse(evt.data);
                if (msg.LinkSide != 8) {
                    throw "Wrong LinkSide";
                }
                var body = JSON.parse(msg.Body);
                switch (msg.MajorId) {
                    case 0: // Common
                        switch (msg.MinorId) {
                            case 0:
                                this.onLogin(body);
                                break;
                            case 1:
                                this.onLogout(body);
                                break;
                            case 2:
                                this.onKick(body);
                                break;
                            case 3:
                                this.onNotify(body);
                                break;
                        }
                        break;
                    case 2: // Queue
                        switch (msg.MinorId) {
                            case 0:
                                this.onQueueStatus(body);
                                break;
                            case 1:
                                this.onAllRegion(body);
                                break;
                            case 2:
                                this.onOneRegion(body);
                                break;
                            case 3:
                                this.onEnqueue(body);
                                break;
                            case 4:
                                this.onDequeue(body);
                                break;
                            case 5:
                                this.onConnectGS(body);
                                break;
                            case 6:
                                this.onRunningGames(body);
                                break;
                        }
                        break;
                    case 3: // Room
                        switch (msg.MinorId) {
                            case 0:
                                this.onRoomList(body);
                                break;
                            case 1:
                                this.onJoinRoom(body);
                                break;
                        }
                        break;
                }
            } catch (err) {
                console.log("Error: " + err + "\n");
                this.sock.close();
            }
        }
    }
};

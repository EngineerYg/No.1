var GmcClient = {
    client_ver: "20150715",
    sock: null,
    ip: "127.0.0.1",
    //ip: "10.0.4.110",
    port: "14000",
    error: 0,
    reconnectTimes: 0,
    account_id: 0,
    device_uuid: "",
    login_token: "",
    nickname: "",
    auto_reconnect: true,    //  是否重连
    is_open_status: false,    //  是否连接上
    is_try_open_status: false, // 尝试链接状态
    userdata: '',    // web自定义的参数，此参数可用来验证游戏是否启动成功，此参数不宜过长
    deviceuuid: '',
    logintoken: '',
    userid: '999',
    username: 'ali',
    level:0,
    viplevel:0,
    reconnect:0,
    gsmid: 0,
    gsmtoken: '',
    gsip: '',
    gstcpport: '9030',
    gsudpport: '9030',
    gamepackid: '0',
    gameid: 0,
    gamename: '',
    gameimg: 'http://image.tianjimedia.com/uploadImages/2012/110/730QS345R5OK_1000x500.jpg',
    gameimggc: '', //游戏手柄操控图
    gameimgkm: '',//游戏键鼠操控图
    gamemode: '2',
    payment: '2',
    serialid: '0',
    saveid: '-1',
    role: '0',
    audiobitrate: '128',
    aacprofile: '0',
    channel: '2',
    samplerate: '44100',
    videobitratefluent: '0',
    videobitratestandard: '0',
    videobitratehigh: '0',
    videobitratesuper: '0',
    videobitrate: '1',
    h264profile: '1',
    width: '1280',
    height: '720',
    fps: '30',
    inputdevice: '',
    base64EncodeChars: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/",
    client_ver_url: '',
    /*
     deviceuuid		设备UUID
     logintoken		账户在此设备上登录成功后得到的token,用于GS找Web验证
     userid			账户ID
     username        玩家昵称
     */
    open_gmc_help_client: function () {
        location.href = 'gmc://gloud.cn/gmc/gmchelperopen?server=' + encodeURI(this.client_ver_url);
    },
    /*
     optoken					运维token,此token会与指定的token文件比较,若相同则绕过gsm上线验证
     deviceuuid				设备UUID
     logintoken				账户在此设备上登录成功后得到的token,用于GS找Web验证
     userid					账户ID
     username				玩家昵称
     gsmid					GSM ID
     gsmtoken				登陆时用来验证的token,由GSM保存的token计算是否有效及超时
     gsip					GS服务器地址，如10.0.4.126
     gstcpport				GS TCP端口，如9000
     gsudpport				如果设置为和GS TCP端口一致,则使用UDP模式，如9001
     gamepackid				游戏所属的游戏包ID
     gameid					游戏ID
     gamename				游戏名称
     gameimg					游戏图片
     gamemode				要求游戏模式，可取值为1（单用户单存档）、2（单用户无存档），3（多用户单存档）、4（多用户无存档）
     payment					本次游戏的付费方式，可取值为0（试玩）、1（街机投币）、2（单次计费）、3（时间计费）、4（包月）、5（买断）、6（擂台）
     serialid				要用到的存档序列ID,代表这个账户在这个游戏上的某个存档序列.只有GameMode和Payment需要存档时才生效
     saveid					要用到的存档ID,也就是接着这个存档玩;save_id=-1表示从空存档开始玩.只有GameMode和Payment需要存档时才生效
     audiobitrate			请求GS输出的音频码率，单位为kbps，如128
     aacprofile				请求GS输出的AAC Profile，可取值为0（low）
     channel					请求GS输出的声道数，如1、2、4、8
     samplerate				请求GS输出的采样率，如44100
     videobitratefluent		游戏流畅码率，单位kbps
     videobitratestandard	游戏标清码率，单位kbps
     videobitratehigh		游戏高清码率，单位kbps
     videobitratesuper		游戏超清码率，单位kbps
     videobitrate			请求GS输出视频码率等级，0（流畅）、1（标清）、2（高清）、3（超清）
     h264profile				请求GS H264 Profile编码标准，可取值为0（baseline）、1（main）、2（high）
     width					请求GS输出视频宽度,请求游戏信息时会得到此项参考值，如1280
     height					请求GS输出视频高度,请求游戏信息时会得到此项参考值，如720
     fps						请求GS输出FPS，如30
     */
    open_gmc_client: function () {
        var url_q1 = 'gmc://gloud.cn/gmc/open';
        var url_q2 = 'gmc://gloud.cn/gmc/openwithkey?param=';
        var url = '';
        url += 'userdata=' + encodeURI(this.userdata);
        url += '&deviceuuid=' + encodeURI(this.deviceuuid);
        url += '&logintoken=' + encodeURI(this.logintoken);
        url += '&userid=' + encodeURI(this.userid);
        url += '&username=' + encodeURI(this.username);
        url += '&gsmid=' + encodeURI(this.gsmid);
        url += '&gsmtoken=' + encodeURI(this.gsmtoken);
        url += '&gsip=' + encodeURI(this.gsip);
        url += '&gstcpport=' + encodeURI(this.gstcpport);
        url += '&gsudpport=' + encodeURI(this.gsudpport);
        url += '&gamepackid=' + encodeURI(this.gamepackid);
        url += '&gameid=' + encodeURI(this.gameid);
        url += '&gamename=' + encodeURI(this.gamename);
        //url += '&gameimg=' + encodeURI(this.gameimg);
        url += '&gameimggc=' + encodeURI(this.gameimggc);
        url += '&gameimgkm=' + encodeURI(this.gameimgkm);
        url += '&inputdevice=' + encodeURI(this.inputdevice);
        url += '&gamemode=' + encodeURI(this.gamemode);
        url += '&payment=' + encodeURI(this.payment);
        url += '&serialid=' + encodeURI(this.serialid);
        url += '&saveid=' + encodeURI(this.saveid);
        url += '&role=' + encodeURI(this.role);
        url += '&audiobitrate=' + encodeURI(this.audiobitrate);
        url += '&aacprofile=' + encodeURI(this.aacprofile);
        url += '&channel=' + encodeURI(this.channel);
        url += '&samplerate=' + encodeURI(this.samplerate);
        url += '&videobitratefluent=' + encodeURI(this.videobitratefluent);
        url += '&videobitratestandard=' + encodeURI(this.videobitratestandard);
        url += '&videobitratehigh=' + encodeURI(this.videobitratehigh);
        url += '&videobitratesuper=' + encodeURI(this.videobitratesuper);
        url += '&videobitrate=' + encodeURI(this.videobitrate);
        url += '&h264profile=' + encodeURI(this.h264profile);
        url += '&width=' + encodeURI(this.width);
        url += '&height=' + encodeURI(this.height);
        url += '&fps=' + encodeURI(this.fps);
        url_q1 += url;

        console.log(encodeURI(url_q1));
        var base64_url = this.base64encode(url);
        url_q2 += base64_url;
        console.log(encodeURI(url_q2));

        // 这种写法在IE下仅支持到508个字节
        //location.href = encodeURI(url_q2);

        // 下面这种写法在IE下可以支持到2000个字节
        // Remove old frame
        $('#hiddenIFrameToRunGame').remove();
        // Add new one
        $('<iframe />', {
            'id': 'hiddenIFrameToRunGame',
            'name': 'hiddenIFrameToRunGame',
            'src': encodeURI(url_q2),
            'style': 'display: none;'
        }).appendTo("body");
    },
    /**
     * base64编码
     * @param {Object} str
     */
    base64encode: function (str) {
        var out, i, len;
        var c1, c2, c3;
        len = str.length;
        i = 0;
        out = "";
        while (i < len) {
            c1 = str.charCodeAt(i++) & 0xff;
            if (i == len) {
                out += this.base64EncodeChars.charAt(c1 >> 2);
                out += this.base64EncodeChars.charAt((c1 & 0x3) << 4);
                out += "==";
                break;
            }
            c2 = str.charCodeAt(i++);
            if (i == len) {
                out += this.base64EncodeChars.charAt(c1 >> 2);
                out += this.base64EncodeChars.charAt(((c1 & 0x3) << 4) | ((c2 & 0xF0) >> 4));
                out += this.base64EncodeChars.charAt((c2 & 0xF) << 2);
                out += "=";
                break;
            }
            c3 = str.charCodeAt(i++);
            out += this.base64EncodeChars.charAt(c1 >> 2);
            out += this.base64EncodeChars.charAt(((c1 & 0x3) << 4) | ((c2 & 0xF0) >> 4));
            out += this.base64EncodeChars.charAt(((c2 & 0xF) << 2) | ((c3 & 0xC0) >> 6));
            out += this.base64EncodeChars.charAt(c3 & 0x3F);
        }
        return out;
    },


    /*  关闭 gmc-helper */
    close_gmc_helper: function () {
        console.log('gmc-helper-client close');
        if (this.sock && this.sock.readyState == WebSocket.OPEN) {
            this.auto_reconnect = false;
            this.sock.close();
        }
        var url = 'gmc://gloud.cn/gmc/gmchelperclose';
        location.href = url;
    },
    /*  关闭 gmc */
    close_gmc: function () {
        console.log('gmc-client close');
        var url = 'gmc://gloud.cn/gmc/close';
        location.href = url;
    },
    /* 快速关闭 gmc-helper */
    app_close: function () {
        var app_close_json = '{"type":"app","subtype":"close","content":{}}';
        console.log("app_close " + app_close_json + "\n");
        reconnectTimes = 0;
        this.auto_reconnect = false;
        this.sock.send(app_close_json);
    },
    /*  连接websocket */
    start: function () {

        if (this.sock && this.sock.readyState == WebSocket.OPEN) {
            console.log("already connected.");
            return;
        }

        var c = this;
        // Connect to GMC
        this.sock = new WebSocket("ws://" + c.ip + ":" + c.port + "/ws");
        this.sock.binaryType = "arraybuffer"; // We are talking binary

        this.sock.onopen = function () {
            c.is_open_status = true;
            c.onOpen();
        };

        this.sock.onclose = function () {
            c.reconnectTimes++;
            console.log("Disconnected from " + c.ip + ":" + c.port + ". " + c.reconnectTimes + " times.\n");
            //超过 15秒重试超时,或者服务器端失去连接
            if (c.reconnectTimes > 1) {
                console.log("Disconnected from " + c.ip + ":" + c.port + ". " + c.reconnectTimes + " times. timeout close connected\n");
                c.is_open_status = false;
                c.onClose();
                return;
            }
            // 不要频繁的重连，最长10秒重连一次
            if (c.auto_reconnect) {
                setTimeout(function () {
                    c.start()
                }, 2000);
            }
            c.auto_reconnect = true;   //  是否重连
            c.is_open_status = false;    //  是否连接上
        };
        this.sock.onerror = function () {
            c.error = 1;
            c.onError();
        },

            this.sock.onmessage = function (evt) {
                c.onMessage(evt);
            };
    },
    onError: function () {

    },
    /*连接上GMC help*/
    onOpen: function () {
    },
    /*没有连接上GMC help*/
    onClose: function () {
        console.log("socket connect is " + this.is_open_status + "\n");
        //$('#download_install').show();
    },
    // 更新客户端
    /**
     update-update格式: {
					      type    : "update", 
						  subtype : "update", 
						  content : {
									    update : "0", 				// 0 : 不更新    1 : 更新
						            }, 
					  }
     */
    update_update: function () {
        var update_json = '{"type":"update","subtype":"update","content":{"update":"1"}}';
        console.log("update_update " + update_json + "\n");
        this.sock.send(update_json);
    },
    //主动查询是否有新版本
    update_query: function () {
        var query_json = '{"type":"update","subtype":"query","content":{"server":"' + this.client_ver_url + '"}}';
        console.log("update_query " + query_json + "\n");
        this.sock.send(query_json);
    },

    /**
     update-info格式: {
				        type    : "update", 
					    subtype : "info", 
					    content :  { 
								       curver : "20150729", 		// 当前版本
									   newver : "20150730", 		// 新版本，为空表示没有更新
									   force  : "0",				// 非强制为0，强制为1
									   desc	  : "", 				// 新版本描述
									   status : "0",				// 0 : 无任何更新动作    1 : 下载中（此情况可能由其他网页触发）    2 : 安装中（此情况可能由其他网页触发）
								   },
				    }
     */
    onUpdateInfo: function (msg) {
        //console.log("subtype info\n");
        console.log("onUpdateInfo: type:" + msg.type + "needupdate:" + msg.content.needupdate + "content.status:" + msg.content.status + "\n");
        //return msg;
    },

    /**
     app-open格式: {
				       type	: "app",
								subtype	: "open",
								content	: {
										      target : "gmc", 				// 要开启的程序
											  param : "base64"				// oepnwithkey协议的param参数
										  },
				    }
     */
    app_open: function () {
        //console.log("subtype info\n");
        var url = '';
        url += 'userdata=' + encodeURI(this.userdata);
        url += '&deviceuuid=' + encodeURI(this.deviceuuid);
        url += '&logintoken=' + encodeURI(this.logintoken);
        url += '&userid=' + encodeURI(this.userid);
        url += '&username=' + encodeURI(this.username);
        url += '&level=' + encodeURI(this.level);
        url += '&viplevel=' + encodeURI(this.viplevel);
        url += '&gsmid=' + encodeURI(this.gsmid);
        url += '&gsmtoken=' + encodeURI(this.gsmtoken);
        url += '&gsip=' + encodeURI(this.gsip);
        url += '&gstcpport=' + encodeURI(this.gstcpport);
        url += '&gsudpport=' + encodeURI(this.gsudpport);
        url += '&gamepackid=' + encodeURI(this.gamepackid);
        url += '&gameid=' + encodeURI(this.gameid);
        url += '&gamename=' + encodeURI(this.gamename);
        //url += '&gameimg=' + encodeURI(this.gameimg);
        url += '&gameimggc=' + encodeURI(this.gameimggc);
        url += '&gameimgkm=' + encodeURI(this.gameimgkm);
        url += '&inputdevice=' + encodeURI(this.inputdevice);
        url += '&gamemode=' + encodeURI(this.gamemode);
        url += '&payment=' + encodeURI(this.payment);
        url += '&serialid=' + encodeURI(this.serialid);
        url += '&saveid=' + encodeURI(this.saveid);
        url += '&role=' + encodeURI(this.role);
        url += '&audiobitrate=' + encodeURI(this.audiobitrate);
        url += '&aacprofile=' + encodeURI(this.aacprofile);
        url += '&channel=' + encodeURI(this.channel);
        url += '&samplerate=' + encodeURI(this.samplerate);
        url += '&videobitratefluent=' + encodeURI(this.videobitratefluent);
        url += '&videobitratestandard=' + encodeURI(this.videobitratestandard);
        url += '&videobitratehigh=' + encodeURI(this.videobitratehigh);
        url += '&videobitratesuper=' + encodeURI(this.videobitratesuper);
        url += '&videobitrate=' + encodeURI(this.videobitrate);
        url += '&h264profile=' + encodeURI(this.h264profile);
        url += '&width=' + encodeURI(this.width);
        url += '&height=' + encodeURI(this.height);
        url += '&fps=' + encodeURI(this.fps);
        console.log("app-open old key:" + url + "\n");
        var base64_url = this.base64encode(url);
        var query_json = '{"type":"app","subtype":"open","content":{"target" : "gmc","param" : "' + base64_url + '"}}';
        console.log("app-open json_str:" + query_json + "\n");
        this.sock.send(query_json);
        //return msg;
    },

    /*
     update-download格式: {
     type    : "update",
     subtype : "download",
     content : {
     status   : "0", 								// 0 : 即将开始下载    1 : 下载中    2 : 下载成功    3 : 下载失败
     progress : "0", 								// 如果status为1则此值有意义
     reason   : "游戏正在运行，无法安装更新！"		//
     },
     }
     */
    onDownload: function (msg) {
        console.log("subtype download\n");
        return msg;
    },
    /*
     update-install格式: {
     type    : "update",
     subtype : "install",
     content : {
     status : "0", 							// 0 : 即将开始安装    1 : 安装中    2 : 安装成功    3 : 安装失败
     progress : "0", 						// 如果status为1则此值有意义
     reason : "网络断开连接！", 			//
     },
     }
     */
    onInstall: function (msg) {
        console.log("subtype install\n");
        return msg;
    },
    /*gameinfo 协议*/

    gameinfo_query: function () {
        console.log("gameinfo_query\n");
        var gameinfo_json = '{"type":"gameinfo","subtype":"query","content":{}}';
        this.sock.send(gameinfo_json);
    },

    /*调用gmc使用ie打开url */
    urlopenwithie: function (url) {
        console.log("urlopenwithie\n");
        console.log("url:"+url);
        var urlopenwithurl_json = '{"type":"ie","subtype":"open","content":{"url":"'+url+'"}}';
        console.log(urlopenwithurl_json);
        this.sock.send(urlopenwithurl_json);
    },
    /*gmchelper接收到gameinfo会向网页汇报gameinfo-info信息
     gameinfo-query响应格式：{
     type		: "gameinfo",
     subtype	: "info",
     content	: {
     userdata				: "", 	// 此值为网页自定义
     userpaccount			: "", 	// 用户渠道帐号
     useragent				: "", 	// 用户浏览器描述
     optoken				: "", 	// op令牌，直连gs此值必填
     deviceuuid			: "", 	// 设备uuid
     logintoken			: "", 	// 登录令牌
     userid				: "", 	// 用户ID
     username				: "", 	// 用户名
     gsmid					: "", 	// gsmid
     gsmtoken				: "", 	// gsm令牌
     gsip					: "", 	// 游戏服务器ip
     gamename				: "", 	// 游戏名称
     gameimg				: "", 	// 游戏图片
     gstcpport				: "", 	// 游戏服务器tcp端口
     gsudpport				: "", 	// 游戏服务器udp端口
     gamepackid			: "", 	// 游戏包id
     gameid				: "", 	// 游戏id
     gamemode				: "", 	// 游戏模式
     payment				: "", 	// 付费模式
     serialid				: "", 	// 存档序列id
     saveid				: "", 	// 存档id
     audiobitrate			: "", 	// 声音码率
     aacprofile			: "", 	// aac profile
     channel				: "", 	// 声道数
     samplerate			: "", 	// 采样率
     videobitratefluent	: "", 	// 视频流畅码率
     videobitratestandard	: "", 	// 视频标准码率
     videobitratehigh		: "", 	// 视频高清码率
     videobitratesuper		: "", 	// 视频超清码率
     videobitrate			: "", 	// 视频码率
     h264profile			: "", 	// h264 profile
     width					: "", 	// 视频宽
     height				: "", 	// 视频高
     fps					: "",	// 视频帧率
     },
     }
     */
    onGameInfo: function (msg) {
        console.log(msg);
    },
    onMessage: function (evt) {
        if (typeof evt.data == "string") {
            try {
                var msg = JSON.parse(evt.data);
                //console.log('msg:'+msg);
                if (msg.type == 'update') {
                    if (msg.subtype == 'info') {
                        this.onUpdateInfo(msg);
                    } else if (msg.subtype == 'download') {
                        this.onDownload(msg);
                    } else if (msg.subtype == 'install') {
                        this.onInstall(msg);
                    }
                } else if (msg.type == 'gameinfo') {
                    if (msg.subtype == 'info') {
                        this.onGameInfo(msg);
                    }
                }
            } catch (err) {
                console.log("Error: " + err + "\n");
                this.close();
            }
        }
    },
    close: function () {
        console.log('gmc-help-client close');
        this.auto_reconnect = false;
        this.sock = null;
        this.is_open_status = false;
    }
};

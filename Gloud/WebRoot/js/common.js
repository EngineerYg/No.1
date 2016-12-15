$(function () {
	// 验证码生成
	var captcha_img = $('.common_checkcode_div').find('img');
	var verifyimg = captcha_img.attr("src");
	captcha_img.attr('title', '点击刷新');
	captcha_img.click(function(){
		if( verifyimg.indexOf('?')>0){
			$(this).attr("src", verifyimg+'&random='+Math.random());
		}else{
			$(this).attr("src", verifyimg.replace(/\?.*$/,'')+'?'+Math.random());
		}
	});
    $("#j_qq").mouseover(function () {
        $('#j_qq_f').show();
    })
    $("#j_qq").mouseout(function () {
        setTimeout(function () {
            $('#j_qq_f').hide();
        }, 50)
    })
    $("#j_qq_f").mouseover(function () {
        setTimeout(function () {
            $('#j_qq_f').show();
        }, 50)
    })
    $("#j_qq_f").mouseout(function () {
        $('#j_qq_f').hide();
    })
    var floatManager = {
        arr: ['j_login', 'j_regist', 'j_set', 'j_wx', 'j_line', 'j_head', 'j_custom', 'j_save', 'j_set_avatar_tips', 'j_handle', 'j_exchange', 'j_open_vip', 'j_open_time'],
        //click_need_login_arr: ['j_start_game', 'j_buy_game_time', 'j_buy_gamesave'],
        mouseover_arr: ['j_wx', 'j_logout'],

        current: null,
        init: function () {
            this.bindBtn();
            this.checkFloat();
            // this.checkLogin();

        },
        bindBtn: function () {
            var self = this;
            for (var i = 0; i < this.arr.length; i++) {
                if ($('#' + this.arr[i]).length > 0) {
                    $('#' + this.arr[i]).on('click', function () {
                        if (self.current) {
                            $('#' + self.current).removeClass('on');
                            $('#' + self.current + '_f').hide();
                            $('#DivLocker').hide();
                        }
                        $(this).addClass('on');
                        console.log($('#' + this.id + '_f'))
                        $('#' + this.id + '_f').show();
                        self.current = this.id;
                        //点击遮罩

                        if (this.id == 'j_login' || this.id == 'j_regist') {
                            $('#DivLocker').hide();
                        }
                        else {
                            $('#DivLocker').show();
                        }

                        // alert('ddsdsd');
                    })
                }
            }

            for (var i = 0; i < this.arr.length; i++) {
                if ($('#' + this.arr[i]).length > 0) {
                    $('#' + this.arr[i] + '_x').on('click', function () {
                        if (self.current) {
                            $('#' + self.current + '_f').hide();
                        }
                        $('#' + this.id + '_f').hide();
                        self.current = this.id;
                        $('#DivLocker').hide();
                    })
                }
            }


            for (var i = 0; i < this.mouseover_arr.length; i++) {
                if ($('#' + this.mouseover_arr[i]).length > 0) {
                    $('#' + this.mouseover_arr[i]).on('mouseover', function () {
                        if (self.current) {
                            $('#' + self.current).removeClass('on');
                            $('#' + self.current + '_f').hide();
                        }
                        $(this).addClass('on');
                        console.log($('#' + this.id + '_f'))
                        $('#' + this.id + '_f').show();
                        self.current = this.id;
                    });
                    $('#' + this.mouseover_arr[i]).on('mouseout', function () {
                        if (self.current) {
                            $('#' + self.current).removeClass('on');
                            $('#' + self.current + '_f').hide();
                        }
                        $(this).removeClass('on');
                        console.log($('#' + this.id + '_f'))
                        $('#' + this.id + '_f').hide();
                        self.current = this.id;
                    });
                }
            }


        },
        checkFloat: function () {
            var self = this;
            $(document).on('click', function (ev) {
                var obj = ev.srcElement || ev.target;

                if (!self.hasParent(obj, self.current) && !self.hasParent(obj, self.current + '_f')) {
                    console.log(2)
                    $('#' + self.current).removeClass('on');
                    $('#' + self.current + '_f').hide();
                    $('#DivLocker').hide();
                }
            })
        },

        hasParent: function (obj, id) {

            var self = this;
            if (obj.id == id) {
                return true;
            }
            if (obj != document) {
                if (obj.parentNode.id == id) {
                    return true;
                }
                else {
                    return self.hasParent(obj.parentNode, id);
                }
            }
            else {
                return false;
            }
        }
    };
    $('#j_region_f .xw_top_head_close').on('click', function () {
        $('#j_region_f').hide();
    })


    function config() {
        var screen_resolution = ['480','576', '720'];
        var videobitrate = ['流畅', '标清', '高清'];
        var inputdevice = ['手柄', '键鼠'];
        var protocol = ['TCP', 'UDP'];
        var start_methods = ['客户端', '网页'];
        var screen_resolution_nIndex; //标志
        var videobitrate_nIndex;
        var inputdevice_nIndex;
        var protocol_nIndex;
        $('#j_screen_resolution').on('click', function () {
            screen_resolution_nIndex = getConfigIndex(screen_resolution, 'screen_resolution');
            if (screen_resolution_nIndex >= screen_resolution.length - 1) {
                screen_resolution_nIndex = 0;
            }
            else {
                screen_resolution_nIndex++;
            }
            //xw 追加 start
            var obj = $('#j_screen_resolution');
            var top = obj.offset().top - 50;
            var left = obj.offset().left;
            $("#footer_tips").show();
            $("#footer_tips_span").empty();
            $("#footer_tips").css({"top": top, "left": left});
            switch (screen_resolution_nIndex) {
                case 1:
                    $("#footer_tips_span").append('576P（1024*576）建议5M以上宽带使用');
                    break;
                case 2:
                    $("#footer_tips_span").append('720P（1280*720）建议8M以上宽带使用（VIP，SVIP专属）');
                    break;
                case 0:
                    $("#footer_tips_span").append('480P（848*480）建议3M以上宽带使用');
                    break;
                default:
                    break;
            }
            // end

            $(this).html(screen_resolution[screen_resolution_nIndex]);
            store.set('screen_resolution', screen_resolution[screen_resolution_nIndex]);
            var game_text=$("#j_start_game").text();
            if(game_text=='正在游戏中'){
                write_tip_message("下次启动游戏生效");
            }

        });

        $('#j_screen_resolution').on('mouseover', function () {
            screen_resolution_nIndex = getConfigIndex(screen_resolution, 'screen_resolution');
            //xw 追加 start
            var obj = $('#j_screen_resolution');
            var top = obj.offset().top - 50;
            var left = obj.offset().left;
            $("#footer_tips").show();
            $("#footer_tips_span").empty();
            $("#footer_tips").css({"top": top, "left": left});
            switch (screen_resolution_nIndex) {
                case 0:
                    $("#footer_tips_span").append('480P（848*480）建议3M以上宽带使用');
                    break;
                case 1:
                    $("#footer_tips_span").append('576P（1024*576）建议5M以上宽带使用');
                    break;
                case 2:
                    $("#footer_tips_span").append('720P（1280*720）建议8M以上宽带使用（VIP，SVIP专属）');
                    break;
                default:
                    break;
            }
            // end
        });

        $('#j_screen_resolution').on('mouseout', function () {
            screen_resolution_nIndex = getConfigIndex(screen_resolution, 'screen_resolution');
            //xw 追加 start
            var obj = $('#j_screen_resolution');
            var top = obj.offset().top - 50;
            var left = obj.offset().left;
            $("#footer_tips").hide();
            $("#footer_tips_span").empty();
            // end
        });


        (function () {
            screen_resolution_nIndex = getConfigIndex(screen_resolution, 'screen_resolution');
            $('#j_screen_resolution').html(screen_resolution[screen_resolution_nIndex]);
        })();
        $('#j_videobitrate').on('click', function () {
            videobitrate_nIndex = getConfigIndex(videobitrate, 'videobitrate');
            if (videobitrate_nIndex >= videobitrate.length - 1) {
                videobitrate_nIndex = 0;
            }
            else {
                videobitrate_nIndex++;
            }

            //xw 追加 start
            var obj = $('#j_videobitrate');
            var top = obj.offset().top - 50;
            var left = obj.offset().left;
            $("#footer_tips").show();
            $("#footer_tips_span").empty();
            $("#footer_tips").css({"top": top, "left": left});
            switch (videobitrate_nIndex) {
                case 0:
                    $("#footer_tips_span").append('4M宽带推荐使用');
                    break;
                case 1:
                    $("#footer_tips_span").append('4M-8M之间的宽带推荐使用');
                    break;
                case 2:
                    $("#footer_tips_span").append('8M以上宽带推荐使用（SVIP专属）');
                    break;
                default:
                    break;
            }
            // end
            $(this).html(videobitrate[videobitrate_nIndex]);
            store.set('videobitrate', videobitrate_nIndex);
            var game_text=$("#j_start_game").text();
            if(game_text=='正在游戏中'){
                write_tip_message("下次启动游戏生效");
            }

        });

        $('#j_videobitrate').on('mouseover', function () {
            videobitrate_nIndex = getConfigIndex(screen_resolution, 'videobitrate');
            //xw 追加 start
            var obj = $('#j_videobitrate');
            var top = obj.offset().top - 50;
            var left = obj.offset().left;
            $("#footer_tips").show();
            $("#footer_tips_span").empty();
            $("#footer_tips").css({"top": top, "left": left});
            switch (videobitrate_nIndex) {
                case 0:
                    $("#footer_tips_span").append('4M宽带推荐使用');
                    break;
                case 1:
                    $("#footer_tips_span").append('4M-8M之间的宽带推荐使用');
                    break;
                case 2:
                    $("#footer_tips_span").append('8M以上宽带推荐使用（SVIP专属）');
                    break;
                default:
                    break;
            }
            // end
        });

        $('#j_videobitrate').on('mouseout', function () {
            //xw 追加 start

            $("#footer_tips_span").empty();
            $("#footer_tips").hide();
            // en
        });

        (function () {
            var nIndex = getConfigIndex(videobitrate, 'videobitrate');
            $('#j_videobitrate').html(videobitrate[nIndex]);
        })();

        $('#j_inputdevice').on('click', function () {
            var nIndex = getConfigIndex(inputdevice, 'inputdevice');
            if (nIndex >= inputdevice.length - 1) {
                nIndex = 0;
            }
            else {
                nIndex++;
            }
            $(this).html(inputdevice[nIndex]);
            store.set('inputdevice', nIndex);
            var game_text=$("#j_start_game").text();
            if(game_text=='正在游戏中'){
                write_tip_message("下次启动游戏生效");
            }

        });
        (function () {
            var nIndex = getConfigIndex(inputdevice, 'inputdevice');
            $('#j_inputdevice').html(inputdevice[nIndex]);
        })();
        $('#j_protocol').on('click', function () {
            protocol_nIndex = getConfigIndex(protocol, 'protocol');
            if (protocol_nIndex >= protocol.length - 1) {
                protocol_nIndex = 0;
            }
            else {
                protocol_nIndex++;
            }

            //xw 追加 start
            var obj = $('#j_protocol');
            var top = obj.offset().top - 50;
            var left = obj.offset().left;
            $("#footer_tips").show();
            $("#footer_tips_span").empty();
            $("#footer_tips").css({"top": top, "left": left});
            switch (protocol_nIndex) {
                case 0:
                    $("#footer_tips_span").append('TCP模式，游戏画面连贯，网络不好时会产生卡顿、画面延迟现象。冒险解谜类推荐使用');
                    break;
                case 1:
                    $("#footer_tips_span").append('UDP模式，画面延迟小，网络不好时产生花屏现象。竞技射击类推荐使用。');
                    break;
                default:
                    break;
            }
            // end
            $(this).html(protocol[protocol_nIndex]);
            store.set('protocol', protocol[protocol_nIndex]);
            var game_text=$("#j_start_game").text();
            if(game_text=='正在游戏中'){
                write_tip_message("下次启动游戏生效");
            }

        });
        $('#j_protocol').on('mouseover', function () {
            protocol_nIndex = getConfigIndex(protocol, 'protocol');
            //xw 追加 start
            var obj = $('#j_protocol');
            var top = obj.offset().top - 50;
            var left = obj.offset().left;
            $("#footer_tips").show();
            $("#footer_tips_span").empty();
            $("#footer_tips").css({"top": top, "left": left});
            switch (protocol_nIndex) {
                case 0:
                    $("#footer_tips_span").append('TCP模式，游戏画面连贯，网络不好时会产生卡顿、画面延迟现象。冒险解谜类推荐使用');
                    break;
                case 1:
                    $("#footer_tips_span").append('UDP模式，画面延迟小，网络不好时产生花屏现象。竞技射击类推荐使用。');
                    break;
                default:
                    break;
            }
            // end
        });

        $('#j_protocol').on('mouseout', function () {
            videobitrate_nIndex = getConfigIndex(screen_resolution, 'screen_resolution');
            //xw 追加 start
            $("#footer_tips").hide();
            $("#footer_tips_span").empty();
            // end
        });


        (function () {
            var nIndex = getConfigIndex(protocol, 'protocol');
            $('#j_protocol').html(protocol[nIndex]);
        })();

        // start up method
        $('#j_start_method').on('click', function () {
            start_nIndex = getConfigIndex(start_methods, 'start_method');
            if (start_nIndex >= start_methods.length - 1) {
                start_nIndex = 0;
            }
            else {
                start_nIndex++;
            }

            //xw 追加 start
            var obj = $('#j_start_method');
            var top = obj.offset().top - 50;
            var left = obj.offset().left;
            $("#footer_tips").show();
            $("#footer_tips_span").empty();
            $("#footer_tips").css({"top": top, "left": left});
            switch (start_nIndex) {
                case 0:
                    $("#footer_tips_span").append('在客户端打开游戏');
                    break;
                case 1:
                    $("#footer_tips_span").append('在网页打开游戏');
                    break;
                default:
                    break;
            }
            // end
            $(this).html(start_methods[start_nIndex]);
            store.set('start_method', start_methods[start_nIndex]);
            var game_text=$("#j_start_game").text();
            if(game_text=='正在游戏中'){
                write_tip_message("下次启动游戏生效");
            }

        });
        $('#j_start_method').on('mouseover', function () {
            start_nIndex = getConfigIndex(start_methods, 'start_method');
            //xw 追加 start
            var obj = $('#j_start_method');
            var top = obj.offset().top - 50;
            var left = obj.offset().left;
            $("#footer_tips").show();
            $("#footer_tips_span").empty();
            $("#footer_tips").css({"top": top, "left": left});
            switch (start_nIndex) {
                case 0:
                    $("#footer_tips_span").append('在客户端打开游戏');
                    break;
                case 1:
                    $("#footer_tips_span").append('在网页打开游戏');
                    break;
                default:
                    break;
            }
            // end
        });

        $('#j_start_method').on('mouseout', function () {
            //start_nIndex = getConfigIndex(start_methods, 'start_method');
            //xw 追加 start
            $("#footer_tips").hide();
            $("#footer_tips_span").empty();
            // end
        });


        (function () {
            var nIndex = getConfigIndex(start_methods, 'start_method');
            $('#j_start_method').html(start_methods[nIndex]);
        })();
    }

    function getConfigIndex(arr, key) {
        var value = store.get(key);
        if (!value) {
            value = '';
        }
        if (key == 'videobitrate' || key == 'inputdevice') {
            if (!value) {
                return 0;
            }
            else {
                return value - 0;
            }
        }
        var index = null;
        if (arr.indexOf(value) == -1) {
            index = 0;
        }
        else {
            index = arr.indexOf(value);

        }
        return index;
    }

    $('#search_game').on('focus', function () {
        $(this).attr('placeholder', '');
    })
    $('#search_game').on('blur', function () {
        $(this).attr('placeholder', '搜索游戏');
    })
    setTimeout(function () {
        floatManager.init();
        items();
        config();
    }, 300)

})

function setStyle3(obj, name, value) {
    var str = name.charAt(0).toUpperCase() + name.substring(1);
    //Transform
    obj.style['Webkit' + str] = value;
    obj.style['Moz' + str] = value;
    obj.style['ms' + str] = value;
    obj.style['O' + str] = value;
    obj.style[name] = value;
}


function items() {
    var aItems = $('.j_items').children();
    if (aItems.length > 0) {
        aItems.on('click', function () {
            $(this).parent().find('li').removeClass('on');
            $(this).addClass('on');
            $(this).parent().data('index', $(this).index());

            if ($(this).hasClass('j_recharge') || $(this).parents('.j_recharge').length > 0) {
                $('.j_recharge_f').show();
            }
            else {
                $('.j_recharge_f').hide();
            }
        });
    }
}

function toUtf8(str) {

    var out, i, len, c;
    out = "";
    len = str.length;
    for (i = 0; i < len; i++) {
        c = str.charCodeAt(i);
        if ((c >= 0x0001) && (c <= 0x007F)) {
            out += str.charAt(i);
        } else if (c > 0x07FF) {
            out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));
            out += String.fromCharCode(0x80 | ((c >> 6) & 0x3F));
            out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
        } else {
            out += String.fromCharCode(0xC0 | ((c >> 6) & 0x1F));
            out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
        }
    }
    return out;
}
//密码校验,适配字符转换成十进制ascii 后 32-126所有字符
function verify_password(str) {
    for (var i = 0; i < str.length; i++) {
        strCode = str.charCodeAt(i);
        if ((strCode > 126) || (strCode < 33)) {
            return false;
        }
    }
    return true;
}
//common 代码共用__xw

//end  __xw
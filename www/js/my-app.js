// Initialize your app
var myApp = new Framework7();


// Export selectors engine
var $$ = Dom7;

// Add view
var mainView = myApp.addView('.view-main', {
    // Because we use fixed-through navbar we can enable dynamic navbar
    dynamicNavbar: true,
    domCache: false
});

// Generate dynamic page
var dynamicPageIndex = 0;

function createContentPage() {
    mainView.router.loadContent(
        '<!-- Top Navbar-->' +
        '<div class="navbar">' +
        '  <div class="navbar-inner">' +
        '    <div class="left"><a href="#" class="back link"><i class="icon icon-back"></i><span>Back</span></a></div>' +
        '    <div class="center sliding">Dynamic Page ' + (++dynamicPageIndex) + '</div>' +
        '  </div>' +
        '</div>' +
        '<div class="pages">' +
        '  <!-- Page, data-page contains page name-->' +
        '  <div data-page="dynamic-pages" class="page">' +
        '    <!-- Scrollable page content-->' +
        '    <div class="page-content">' +
        '      <div class="content-block">' +
        '        <div class="content-block-inner">' +
        '          <p>Here is a dynamic page created on ' + new Date() + ' !</p>' +
        '          <p>Go <a href="#" class="back">back</a> or go to <a href="services.html">Services</a>.</p>' +
        '        </div>' +
        '      </div>' +
        '    </div>' +
        '  </div>' +
        '</div>'
    );
    return;
}



/* ============== 判断是否登录，未登录则弹出登录user-intro界面 ============ */
myApp.onPageBeforeInit('index-home', function(page) {
    var userLoggedIn = false;
    if (Boolean(userLoggedIn)==true) {
        $$('.login-screen').removeClass('modal-in');
    }
}).trigger();



/* ============== 登录 ============ */
//var loginContainer = $$('.login-screen');
//loginContainer.find('.btn-login').on('click', function() {
//    var phone = loginContainer.find('input[name="phone"]').val();
//    var password = loginContainer.find('input[name="password"]').val();

//    if (phone == '888' && password == '888') {
//        $$('.login-screen').removeClass('modal-in');
//    } else{
//        myApp.alert('登录失败<br/>密码或账号错误', '提示');
//    };
//});

// 点击登陆输入框，图标高亮
$$('.login-form input').on('focusin', function() {
    $$(this).parent().parent().prev().find('i').addClass('active');
});
$$('.login-form input').on('focusout', function() {
    var $$inputIcon = $$(this).parent().parent().prev().find('i');
    if ($$(this).val()=='') {
        $$inputIcon.removeClass('active');
    } else{
        $$inputIcon.addClass('active');
    }
});





/* ============== 注册 ============ */
/*
var registerContainer = $$('#register');
registerContainer.find('#register-btn').on('click', function () {
var registerPhone = registerContainer.find('input[name="phone"]').val();
var registerPassword = registerContainer.find('input[name="code"]').val();
if (registerPhone == "") {
    myApp.alert('请输入正确手机号码', '提示', function () {

    });
}else {
    mainView.router.loadPage('register-info.html');
};
});
*/
// 服务协议
$$('.agreement-text').on('click', function () {
  myApp.modal({
    title:  '',
    text:   '<div class="agreement-wrap"><h3>一、声明与承诺 </h3>'+
            '<p>（一）在接受本协议或您以本公司允许的其他方式实际使用聚美医服务之前，请您仔细阅读本协议的全部内容（特别是以粗体标注的内容）。如果您不同意本协议的任意内容，或者无法准确理解本公司对条款的解释，请不要进行后续操作，包括但不限于不要接受本协议，不使用本服务。如果您对本协议的条款有疑问，请通过本公司客服渠道进行询问，本公司将向您解释条款内容。 </p>'+
            '<p>（二）您同意，如本公司需要对本协议进行变更或修改的，须通过网站公告的方式提前予以公布，公告期限届满后即时生效；若您在本协议内容公告变更生效后继续使用聚美医服务的，表示您已充分阅读、理解并接受变更后的协议内容，也将遵循变更后的协议内容使用聚美医服务；若您不同意变更后的协议内容，您应在变更生效前停止使用聚美医服务。 </p>'+
            '<p>（三）如您为无民事行为能力人或为限制民事行为能力人，例如您未满18周岁，则您应在监护人监护、指导下阅读本协议和使用本服务。若您非自然人，则您确认，在您取得聚美医账户时，或您以其他本公司允许的方式实际使用聚美医服务时，您为在中国大陆地区合法设立并开展经营活动或其他业务的法人或其他组织，且您订立并履行本协议不受您所属、所居住或开展经营活动或其他业务的国家或地区法律法规的排斥。不具备前述条件的，您应立即终止注册或停止使用聚美医服务。 </p>'+
            '<p>（四）您在使用聚美医服务时，应自行判断交易对方是否具有完全民事行为能力并自行决定是否使用聚美医服务与对方进行交易，且您应自行承担与此相关的所有风险。</p>'+
            '<p>（五）您确认，您在聚美医上发生的所有交易，您已经不可撤销地授权聚美医按照其制定的《聚美医网服务协议》及《聚美医规则》、《聚美医争议处理规范》、《交易超时规则》等规则进行处理；同时， 您不可撤销地授权本公司按照聚美医的指令将争议款项的全部或部分支付给交易一方或双方，同时本公司有权从聚美医获取您的相关信息（包括但不限于交易商品描述、物流信息、行为信息、账户相关信息等）。本公司按照聚美医的指令进行资金的止付、扣划完全来自于您的授权，本公司对因此给您造成的任何损失均不承担责任。但您确认，您使用聚美医服务时，您仍应完全遵守本协议及本公司制定的各项规则及页面提示等。</p></div>',
    buttons: [
      {
        text: '已阅读',
        bold: true
      },
    ]
  })
});



/* ============== 完善个人信息 ============ */
myApp.onPageInit('register-info', function (page) {
  var pageContainer = $$(page.container);
  pageContainer.find('#register-info-btn').on('click', function () {
    var phone = pageContainer.find('input[name="name"]').val();
    var password = pageContainer.find('input[name="hospital"]').val();
    if (phone == "") {
        myApp.alert('请填写您的姓名', '提示', function () {

        });
    }else {
        mainView.router.loadPage('index.html');
    };
  });
});



/* ============== 首页 ============ */

//var view1 = myApp.addView('#view-home');
//var view2 = myApp.addView('message-list.html', {
//    dynamicNavbar: true
//});
//var view3 = myApp.addView('#view-news');
//var view4 = myApp.addView('#view-more', {
//    dynamicNavbar: true
//});


/* ============== 停诊时间 ============ */
myApp.onPageInit('time-stop-list', function (page) {
    $$('.add-pause-time').on('click', function() {
        myApp.modal({
            title: '请输入停诊时间',
            text: '<div class="s-modal-title">您发布的停诊时间及备注将通知已预约此时间段的用户，未预约的用户不可预约。</div>',
            afterText: '<div class="pause-time-modal">' +
                '<div class="row no-gutter">' +
                '<div class="col-40">' +
                '<div class="input-field">' +
                '<input type="text" class="modal-text-input" placeholder="" readonly id="picker-date">' +
                '</div>' +
                '</div>' +
                '<div class="col-20"><div class="time-modal-conj">至</div></div>' +
                '<div class="col-40">' +
                '<div class="input-field">' +
                '<input type="text" class="modal-text-input" placeholder="" readonly id="picker-date1">' +
                '</div>' +
                '</div>' +
                '</div>' +
                '<div class="pause-time-remark">' +
                '<div class="item-title label">停诊备注</div>' +
                '<div class="item-input"><textarea placeholder="">临时会议</textarea></div>' +
                '</div>' +
                '</div>',
            buttons: [{
                text: '取消',
                onClick: function() {}
            }, {
                text: '发布',
                bold: true,
                onClick: function() {
                    myApp.confirm('停诊时间发布后不得修改</br>确定继续发布？', '提示');
                }
            }, ]
        })

        var today = new Date();

        var pickerInline = myApp.picker({
            input: '#picker-date',
            toolbar: true,
            rotateEffect: true,
            onClose: function() {
                $$('.modal-overlay').addClass('modal-overlay-visible')
            },

            value: [today.getFullYear(), today.getMonth(), today.getDate(), '上午'],

            onChange: function(picker, values, displayValues) {
                var daysInMonth = new Date(picker.value[2], picker.value[0] * 1 + 1, 0).getDate();
                if (values[1] > daysInMonth) {
                    picker.cols[1].setValue(daysInMonth);
                }
            },

            formatValue: function(p, values, displayValues) {
                return displayValues[0] + '.' + displayValues[1] + '.' + values[2] + ' ' + values[3];
            },

            cols: [
                // Years
                {
                    values: (function() {
                        var arr = [];
                        for (var i = 1950; i <= 2030; i++) {
                            arr.push(i);
                        }
                        return arr;
                    })(),
                    textAlign: 'right'
                },
                // Months
                {
                    values: ('0 1 2 3 4 5 6 7 8 9 10 11').split(' '),
                    displayValues: ('1 2 3 4 5 6 7 8 9 10 11 12').split(' '),
                    textAlign: 'left'
                },
                // Days
                {
                    values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31],
                    textAlign: 'left'
                },
                // Hours
                {
                    values: ['上午', '下午'],
                    textAlign: 'left'
                }
            ]
        });

        var pickerInline = myApp.picker({
            input: '#picker-date1',
            toolbar: true,
            rotateEffect: true,
            onClose: function() {
                $$('.modal-overlay').addClass('modal-overlay-visible')
            },

            value: [today.getFullYear(), today.getMonth(), today.getDate(), '上午'],

            onChange: function(picker, values, displayValues) {
                var daysInMonth = new Date(picker.value[2], picker.value[0] * 1 + 1, 0).getDate();
                if (values[1] > daysInMonth) {
                    picker.cols[1].setValue(daysInMonth);
                }
            },

            formatValue: function(p, values, displayValues) {
                return displayValues[0] + '.' + displayValues[1] + '.' + values[2] + ' ' + values[3];
            },


            cols: [
                // Years
                {
                    values: (function() {
                        var arr = [];
                        for (var i = 1950; i <= 2030; i++) {
                            arr.push(i);
                        }
                        return arr;
                    })(),
                    textAlign: 'right'
                },
                // Months
                {
                    values: ('0 1 2 3 4 5 6 7 8 9 10 11').split(' '),
                    displayValues: ('1 2 3 4 5 6 7 8 9 10 11 12').split(' '),
                    textAlign: 'left'
                },
                // Days
                {
                    values: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31],
                    textAlign: 'left'
                },
                // Hours
                {
                    values: ['上午', '下午'],
                    textAlign: 'left'
                }
            ]

        });
    });
});

var lastdate = "";
var isprocess = false;
var userid = "";
var password = "";
var conn = null;
var to = "";
var doctorsno = "";
var customersno = "";
var curdt = null;
var customerpic = "";
var doctorpic = "";
var accesstoken = "";
var appkey = "";
var fromname = "";
var cuspic = "";
var nowtime = null;
var flag = "1";
/*=============== message=============*/
myApp.onPageInit('messages', function (page) {


    customersno = page.query.customersno;
    doctorsno = page.query.drsno;

    conn = new Easemob.im.Connection();
    $.Frame.Ajax.Ajax({
        url: $.Frame.Config.Constant.ServerUrl + "webim.imload_app.go",
        postdata: {
            doctorsno: doctorsno,
            customersno: customersno
        },
        success: function (rtn) {
            if (rtn.issuccess) {
                myApp.hidePreloader();
                userid = rtn.doctor_webim_userid;
                password = rtn.doctor_webim_pass;
                to = rtn.customer_webim_userid;
                fromname = rtn.customer_name;
                customerpic = rtn.customer_headpic;
                doctorpic = rtn.doctor_headpic;
                accesstoken = rtn.accesstoken;
                appkey = rtn.appkey;

                $(".fromname").text(fromname);
                if (rtn.data) {
                    for (var i = 0; i < rtn.data.length; i++) {
                        if (curdt == null) {
                            curdt = rtn.data[i].createdt;
                            rtn.data[i].isshowtime = true;
                        } else {
                            if (curdt.dateDiff("n", rtn.data[i].createdt) > 20) {
                                rtn.data[i].isshowtime = true;
                                curdt = rtn.data[i].createdt;
                            }
                        }
                        rtn.data[i].createdtstr = rtn.data[i].createdt.format("yyyy-MM-dd HH:mm");
                        rtn.data[i].fromtype = rtn.data[i].from == userid ? "d2c" : "c2d";
                        rtn.data[i].customerpic = customerpic;
                        rtn.data[i].doctorpic = doctorpic;
                        rtn.data[i].flag = "1";
                    }
                    $("#itemdatamessage").tmpl(rtn.data).appendTo('.messages');
                       $(".messages").attr("style","margin-bottom:-20px;")
                    scrollBottomLate();
                    auto2anchor();
                } else {
                    curdt = new Date();
                }
                myApp.showPreloader("聊天系统初始化...");
                conn.init({
                    onOpened: function () {
                        conn.setPresence();
                        myApp.hidePreloader();
                        scrollBottomLate();
                        var id1 = setInterval(function () {
                            $('.page-content').scrollTop($('.page-content')[0].scrollHeight);
                            clearInterval(id1);
                        }, 5000);
                        var id2 = setInterval(function () {
                            $('.page-content').scrollTop($('.page-content')[0].scrollHeight);
                            clearInterval(id2);
                        }, 10000);

                    },
                    onTextMessage: function (message) {
                        var from = message.from; //消息的发送者
                        if (from == to) {
                            var mestype = message.type; //消息发送的类型是群组消息还是个人消息
                            var messageContent = message.data; //文本消息体
                            if (mestype == 'groupchat') {
                                //进行群组消息页面处理
                            } else {
                                //进行个人消息页面处理
                            }
                            var list = new Array();
                            list[0] = {
                                isshowtime: false,
                                fromtype: 'c2d',
                                type: 'txt',
                                msg: messageContent,
                                customerpic: customerpic,
                                doctorpic: doctorpic
                            }
                            if (curdt.dateDiff("n", new Date()) > 20) {
                                list[0].isshowtime = true;
                                curdt = new Date();
                                flag = "0";
                                nowtime = curdt.format("yyyy-MM-dd HH:mm");
                            }
                            $("#itemdata").tmpl(list).appendTo('.messages');
                            scrollBottomLate();
                            auto2anchor();
                        }
                    },
                    onPictureMessage: function (message) {
                        var filename = message.filename; //文件名称，带文件扩展名
                        var from = message.from; //文件的发送者
                        var ext = message.ext; //获取用户的扩展信息（群聊用法相同）
                        var mestype = message.type; //消息发送的类型是群组消息还是个人消息
                        var options = message;
                        if (from != to) {
                            return;
                        }
                        var list = new Array();
                        list[0] = {
                            isshowtime: false,
                            fromtype: 'd2c',
                            type: 'img',
                            thumb: message.thumb,
                            url: message.url,
                            customerpic: customerpic,
                            doctorpic: doctorpic
                        }
                        $("#itemdatamessage").tmpl(list).appendTo('.messages');
                        scrollBottomLate();
                        auto2anchor();
                    },
                    onClosed: function () {
                        conn.clear();
                        conn.onClosed();
                    }
                });
                conn.open({
                    user: userid,
                    pwd: password,
                    appKey: appkey
                    //accessToken:accesstoken
                });
            } else {
                //closeOverlay();
                //$.Frame.Message.ShowMsg(rtn.msg);

                myApp.hidePreloader();
                myApp.alert(rtn.msg);
            }
        },
        before: function () {
            myApp.showPreloader("加载用户信息");
        },
        fail: function () {
            myApp.hidePreloader();
        },
        complete: function () {
            myApp.hidePreloader();

        }
    });

   

    /**
 *输入框获取焦点显示内容到底部
 */
    $("#chat-content").click(function () {
        var id = setInterval(function () {
            $('.page-content').scrollTop($('.page-content')[0].scrollHeight);
            clearInterval(id);
        }, 400);
    });

    /**
    *图片按钮点击事件
    */
    $("#message-photo").click(function () {
        $("#fileInput").onClick();
    });

    /**
    *图片发送点击事件
    */
    $("#uploadImage").click(function () {
        sendPic();
    });

    function previewFile() {
        var preview = document.querySelector('#preview');
        var reader = new FileReader();
        var file = document.querySelector('#fileInput').files[0];
        document.body.style.padding = '0';
        document.body.style.marginTop = '0';
        reader.addEventListener("load", function () {
            preview.src = reader.result;
            preview.style.width = '100%';
            var a = window.screen.availHeight;
            var b = window.screen.availWidth;
            var c = preview.height;
            var d = preview.width;
            b1 = a / b;
            b2 = c / d;
            if (b1 > b2) {
                var e = -c / 2;
                preview.style.position = 'fixed';
                preview.style.marginTop = e + 'px';
                preview.style.top = '50%';
                preview.style.zIndex = '502';
                document.querySelector('.navbar-through').style.display = 'none';
                document.querySelector('#historymessage').style.display = 'none';
            }
            else {
                preview.style.position = 'static';
                preview.style.marginTop = 0 + 'px';
                document.querySelector('.navbar-through').style.display = 'none';
                document.querySelector('#historymessage').style.display = 'none';
            }
        }, false);
        if (file) {
            reader.readAsDataURL(file);
        }
    }
    //addEventListener('change', function ()

    //$('#fileInput').onchange = function () {
    //    lrz(this.files[0], { width: 400 }, function (results) {
    //        console.log(results);
    //        myApp.showPreloader("图片发送中...");
    //        sendPic();
    //    })
    //}




    /**
     *发送图片取消
     */
    $("#send-cancel").click(function () {
        document.querySelector('#delivery-confirmation-background').style.display = 'none';
        document.querySelector('#delivery-confirmation').style.display = 'none';
        $('#preview').removeAttr("src");
        $('#preview').removeAttr("style");
        document.querySelector('.navbar-through').style.display = 'block';
        //document.querySelector('#historymessage').style.display = 'block';
        document.getElementsByTagName('BODY')[0].scrollTop = document.getElementsByTagName('BODY')[0].scrollHeight;
    });




    /*
     *发送文本消息
     */
    $(".send-message").click(function () {
        var msg = $('#chat-content').val();
        if (msg.trim() == "") {
            myApp.alert("不能发送空消息", "提示", function () {
                $('#chat-content')[0].focus();
            });
            return;
        }
        console.log("消息的内容" + msg);
        var options = {
            to: to,
            msg: msg,
            type: "chat"
        };
        conn.sendTextMessage(options);
        $('#chat-content').val("");
        var list = new Array();
        list[0] = {
            isshowtime: false,
            fromtype: 'd2c',
            type: 'msg',
            msg: msg,
            customerpic: customerpic,
            doctorpic: doctorpic
        }
        if (curdt.dateDiff("n", new Date()) > 20) {
            list[0].isshowtime = true;
            curdt = new Date();
            flag = "0";
            nowtime = curdt.format("yyyy-MM-dd HH:mm");
        }
        scrollBottomNow();

        $.Frame.Ajax.Ajax({
            url: $.Frame.Config.Constant.ServerUrl + "webim.updatelast.go",
            postdata: {
                doctorsno: doctorsno,
                customersno: customersno,
                content: msg,
                msgtype: "text"
            },
            success: function (rtn) {

                myApp.hidePreloader();
                $("#itemdatamessage").tmpl(list).appendTo(".messages");
                scrollBottomNow();

                if (rtn.issuccess) {
                } else {
                    $.Frame.Message.ShowMsg(rtn.msg);
                }
            },
            fail: function () {
                myApp.hidePreloader();
            },
            complete: function () {
                myApp.hidePreloader();
            }
        });
    });




    function auto2anchor() {
        if ($(".myself").size() > 0 && $(".other").size() > 0) {
            if ($(".myself").last().offset().top > $(".other").last().offset().top) {
                $("html,body").animate({ scrollTop: $(".myself").last().offset().top }, 1000);
            } else {
                $("html,body").animate({ scrollTop: $(".other").last().offset().top }, 1000);
            }
        } else if ($(".myself").size() > 0) {
            $("html,body").animate({ scrollTop: $(".myself").last().offset().top }, 1000);
        } else if ($(".other").size() > 0) {
            $("html,body").animate({ scrollTop: $(".other").last().offset().top }, 1000);
        }
    }


});

/**
 *图片预览
 */
//function showfull(url) {
//    var img = new Image();
//    img.src = url;
//    var openPhotoSwipe = function () {
//        var pswpElement = document.querySelectorAll('.pswp')[0];
//        var items = [
//            {
//                src: url,
//                w: img.width,
//                h: img.height
//            }
//        ];
//        var options = {
//            history: false,
//            focus: false,
//            showAnimationDuration: 0,
//            hideAnimationDuration: 0
//        };
//        var gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, items, options);
//        gallery.init();
//    };
//
//    openPhotoSwipe();
//    //MPreview({
//    //    data: [url],
//    //    wrap: '#overlay',
//    //    title: '',
//    //});
//}

function showfull(url) {
    var phontoBowser = myApp.photoBrowser({
                                          zoom:400,
                                          photos:[url],
                                          theme:"dark"
                                          });
    phontoBowser.open();
    
    
}

function scrollBottomLate() {
    //延迟执行
    var id = setInterval(function () {
                         
        $('.page-content').scrollTop($('.page-content')[0].scrollHeight);
        clearInterval(id);
    }, 1000);


    //$('.content').scrollTop();
}

function scrollBottomNow() {
    //正常执行
    $('.page-content').scrollTop($('.page-content')[0].scrollHeight);
}

function Selbtn(obj) {
        myApp.showPreloader("图片发送中...");
        sendPic();


    //lrz(obj.files[0], { width: 400 }, function (results) {
    //    debugger;
    //    myApp.alert(results);
    //    console.log(results);
    //    myApp.showPreloader("图片发送中...");
    //    sendPic();
    //})
}

/**
 *发送图片
 */
function sendPic() {
    //fileInputId：文件选择输入框的Id，sdk自动根据id自动获取文件对象（含图片，或者其他类型文件）
    var fileObj = Easemob.im.Helper.getFileUrl("fileInput");
    if (fileObj.url == null || fileObj.url == '') {
        $.Frame.Message.ShowMsg("请选择发送图片");
        return;
    }
    var filetype = fileObj.filetype;
    var filename = fileObj.filename;
    if (filetype in {
                    "jpg": true,
                    "gif": true,
                    "png": true,
                    "bmp": true,
                    "jpeg": true
    }) {
//        myApp.showPreloader();
        var opt = {
            fileInputId: "fileInput",
            to: to,
            onFileUploadError: function (error) {
                myApp.hidePreloader();
                myApp.alert(error);
                //$.Frame.Message.ShowMsg("图片发送失败");
            },
            onFileUploadComplete: function (data) {
                $("#send-cancel").click();
                myApp.hidePreloader();
                 myApp.showPreloader("图片发送中..999.");
                var list = new Array();
                list[0] = {
                    isshowtime: false,
                    fromtype: 'd2c',
                    type: 'img',
                    thumb: fileObj.url,
                    url: fileObj.url,
                    customerpic: customerpic,
                    doctorpic: doctorpic
                }
                scrollBottomNow();

                myApp.hidePreloader();
                $.Frame.Ajax.Ajax({
                    url: $.Frame.Config.Constant.ServerUrl + "webim.updatelast.go",
                    postdata: {
                        doctorsno: doctorsno,
                        customersno: customersno,
                        content: "",
                        msgtype: "img"
                    },
                    success: function (rtn) {
                        myApp.hidePreloader();
                        $("#itemdatamessage").tmpl(list).appendTo(".messages");
                        scrollBottomNow();
                        if (rtn.issuccess) {
                        } else {
                            $.Frame.Message.ShowMsg(rtn.msg);
                        }
                    },
                    fail: function (ex) {
                        var zz = ex
                        myApp.hidePreloader();
                        myApp.alert("图片发送失败");
                    },
                    complete: function () {
                        myApp.hidePreloader();
                    }
                });
                //处理图片上传成功，如本地消息显示
            }
            // ext:{"extmsg":"extends messages"}//用户自扩展的消息内容（群聊用法相同）
        };
        conn.sendPicture(opt);

        return;
    }
    myApp.alert("不支持此图片类型" + filetype, "提示");
    //$.Frame.Message.ShowMsg("不支持此图片类型" + filetype);
    myApp.hidePreloader();
};


function GoBack()
{
    // mainView.router.back();
    location.href = "message-list.html?drsno=" + doctorsno;
    // mainView.router.loadPage("");
}









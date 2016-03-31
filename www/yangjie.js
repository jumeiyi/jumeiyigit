// Initialize your app


var frame = new Framework7();


// Export selectors engine
var $$ = Dom7;

var mainView = frame.addView('.view-main', {
    // Because we use fixed-through navbar we can enable dynamic navbar
    dynamicNavbar: true,
    domCache: true
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

console.log("杨杰脚本加载成功");
function getDoctorSno(){
    if(localStorage.getItem("doctorSno")!=null||localStorage.getItem("doctorSno")!=''){
        console.log("本地存储doctorSno:"+localStorage.getItem("doctorSno"));
        return localStorage.getItem("doctorSno");
    }
        
    return  getQueryString("doctorsno");
}

frame.onPageInit('record', function (page) {
    frame.showNavbar();
    console.log("record.html页面函数加载成功");
});



frame.onPageInit('reservation-status', function (page){
    console.log("预约界面初始化");
   
    $.Frame.Ajax.Ajax({
        url: $.Frame.Config.Constant.ServerUrl + "myorder.list.go",
        postdata: {
            doctorsno:getDoctorSno(), //"9b503080-4649-4e5f-8a15-11007951f9b1" ,
        },
        success: function (rtn) {
            //发送成功
            if (rtn.issuccess) {        
               // console.log($$("#diagnosis").html());
                var todiagnosis = $("#todiagnosis");
                var diagnosis = $("#diagnosis");
                var totreamt = $("#totreamt");
                var treamt = $("#treamt");
                var tab1 = $("#tab1");
                var tab2 = $("#tab2");
                var tab3 = $("#tab3");
                var tab4 = $("#tab4");
                //console.log(todiagnosis.html());
                //console.log(tab1.html());
                if (rtn.todiagnosis == null |rtn.todiagnosis==''| rtn.todiagnosis == undefined) {
                    $$("#remind").removeAttr("hidden");
                    console.log($$("#remind").prop("display"));
                } else {
                    todiagnosis.tmpl(rtn.todiagnosis).appendTo(tab1);
                }
                diagnosis.tmpl(rtn.diagnosis).appendTo(tab2);
                totreamt.tmpl(rtn.totreamt).appendTo(tab3);
                treamt.tmpl(rtn.treamt).appendTo(tab4);

                //重设页面高,否则只有一部分数据显示出来
                $(".tabs-animated-wrap").css("height", "auto");
                //固定导航栏和菜单栏
                $(".navbar").css("position", "fixed");
                $(".tabs-navbar").css({
                    "position": "relative",
                    "margin-top":"44px"
                })

                $(".toolbar-hidden").removeClass("toolbar-hidden");

                AddEvent();
            } else {

                myApp.alert("错误的请求");
            }
        }
    });
    AddEvent();

    function AddEvent() {
      


        var item = '';
        // 取消预约
        $('.cancle-reserve').on('click', function () {
            
            item=null;
            //顶端的item
            item = $(this).parent().parent().parent().parent();
            var reservedate = item.find(".reserve-time");
            var reservetime = item.find(".time");
            var ordersno = $(this).data("ordersno").toString();
            console.log("订单日期:"+reservedate.html()+reservetime.text());
            console.log("订单编号:"+ordersno);
            var popupHTML = '<div class="popup reserve-popup">' +
                    '<div class="view navbar-fixed">' +
                        '<div class="pages">' +
                            '<div class="page">' +
                                '<div class="navbar">' +
                                    '<div class="navbar-inner">' +
                                        '<div class="left"><a href="#" class="link close-popup"><i class="icon icon-back"></i></a></div>' +
                                       ' <div class="center">因故取消</div>' +
                                    '</div>' +
                               ' </div>' +
                                '<div class="page-content">' +
                                    '<p class="reserve-tip">立即取消预约，可能导致患者投诉，如果执行，聚美医不承担相关责任，建议推迟就诊时间和患者商议好后点击取消。<p>' +
                                    '<div class="list-block">' +
                                      '<div class="list-block-title">我需要取消的就诊时间</div>' +
                                      '<p class="cancle-time">'+reservedate.html()+reservetime.text()+'</p>' +
                                    '</div>' +
                                    '<div class="list-block">' +
                                      '<div class="list-block-title">我的取消原因：</div>' +
                                      '<ul>' +
                                        '<li class="align-top">' +
                                          '<div class="item-content">' +
                                            '<div class="item-inner">' +
                                              '<div class="item-input">' +
                                                '<textarea id="cancelreason"></textarea>' +
                                              '</div>' +
                                            '</div>' +
                                          '</div>' +
                                        '</li>' +
                                      '</ul>' +
                                    '</div>' +
                                    '<div class="list-block">' +
                                      '<div class="list-block-title">选择取消原因</div>' +
                                      '<ul>' +
                                        '<li>' +
                                          '<label class="label-radio item-content">' +
                                            '<input type="radio" name="my-radio" value="" checked="checked"/>' +
                                           ' <div class="item-inner">' +
                                              '<div class="item-title">临时就诊，改时间再约，抱歉</div>' +
                                            '</div>' +
                                          '</label>' +
                                        '</li>' +
                                        '<li>' +
                                          '<label class="label-radio item-content">' +
                                            '<input type="radio" name="my-radio" value=""/>' +
                                            '<div class="item-inner">' +
                                              '<div class="item-title">临时会议，改时间再约，抱歉</div>' +
                                            '</div>' +
                                          '</label>' +
                                        '</li>' +
                                        '<li>' +
                                          '<label class="label-radio item-content">' +
                                            '<input type="radio" name="my-radio" value=""/>' +
                                            '<div class="item-inner">' +
                                              '<div class="item-title">临时请假，改时间再约，抱歉</div>' +
                                            '</div>' +
                                          '</label>' +
                                        '</li>' +
                                      '</ul>' +
                                    '</div>' +
                                    '<a href="#" class="link close-popup cancle-btn button" data-ordersno="'+ordersno+'">立即取消</a>' +
                                '</div>' +
                            '</div>' +
                        '</div>' +
                    '</div>' +
                '</div>'
            myApp.popup(popupHTML);
       
            $(".close-popup").click(
                function (){
                    var cancelreason = $("#cancelreason").text();
                    //若是没有填写原因，则选中的原因作为数据提交
                    if (cancelreason == '' || cancelreason == undefined || cancelreason == null) {
                        console.log($("input[name=my-radio]:checked").text());
                        cancelreason=$("input[name=my-radio]:checked").next().text();
                    }

                    var reservedate = item.find(".reserve-time");
                    var reservetime = item.find(".time");
                    var ordersno = $(this).data("ordersno");
                    item.remove();
                   
                    return false;

                    console.log(ordersno);
                    $.Frame.Ajax.Ajax({
                        url: "http://localhost:5401/" + "myorder.cancelorder.go",
                        postdata:{ 
                            ordersno: ordersno,
                            cancelreason:cancelreason
                        },
                        success:function(rtn){
                            if(rtn.issuccess){
                             
                            }
                        }
                    });
                });
        });
        // 预约治疗
        $$('.reserve-treatment').on('click', function(){
            var ordersno = $(this).data("ordersno");
            console.log("预约治疗时间的ordersno:"+ordersno);
            var name = $$(this);
            var today = new Date();
            var reserveTime = myApp.picker({
                input: name,
                toolbarTemplate: '<div class="toolbar">' +
                    '<div class="toolbar-inner">' +
                    '<div class="left"><a href="#" class="link close-picker">取消</a></div>' +
                    '<div class="center">请选择预约时间</div>' +
                    '<div class="right">' +
                    '<a href="#" class="link close-picker" id="save" data-ordersno="'+ordersno+ '">完成</a>' +
                    '</div>' +
                    '</div>' +
                    '</div>',
                toolbar: true,
                rotateEffect: true,
                onClose: function (){
                    $$('.modal-overlay').addClass('modal-overlay-visible');
               
                },
                value: [today.getFullYear(), today.getMonth(), today.getDate(), '上午'],
                onChange: function (picker, values, displayValues) {
                    var daysInMonth = new Date(picker.value[2], picker.value[0] * 1 + 1, 0).getDate();
                    if (values[1] > daysInMonth) {
                        picker.cols[1].setValue(daysInMonth);
                    }
                   

                    
                },
                formatValue: function (p, values, displayValues) {
                    return displayValues[0] + '.' + displayValues[1] + '.' + values[2] + ' ' + values[3];
                }, onOpen: function (picker) {
                    picker.container.find('.destroy-picker').on('click', function () {
                        picker.close();
                        picker.destory();
                    });
                },
                cols: [
                    // Years
                    {
                        values: (function () {
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
            reserveTime.open();
            //添加发送取消预约的Ajax事件
            $("#save").click(function () {
                var ordersno = $(this).data("ordersno");
                console.log(ordersno);
                reserveTime = reserveTime.value.toString().replaceAll(',', '-');
                $.Frame.Ajax.Ajax({
                    url:"http://localhost:5401/"+"myorder.settreatdt.go",
                    postdata:{
                        ordersno: ordersno,
                        treatdt:reserveTime,  
                    },
                    success:function(rtn){
                        if (rtn.issuccess){
                            //完成取消,移除当前的订单信息的html代码

                            console.log(rtn);
                            
                            frame.alert(rtn.msg,"正确");
                        }else{
                            frame.alert(rtn.msg,"抱歉");
                        }
                    }
                });
                console.log(reserveTime);
            });
        });

        // 已预约
        $$('.reserve-done').on('click', function () {
            myApp.modal({
                title: '您已和患者预约治疗时间',
                text: '<div class="reserve-done-modal"><h4>尊敬的医生您好：</h4><p>您已和患者XXX约定治疗时间为：2015年12月13日，系统已提醒您的患者，请您也按时准备手术，祝您顺利！</p></div>',
                afterText:
                '',
                buttons: [
                {
                    text: '知道了，谢谢',
                }
                ]
            })
        });

        // 修改时间
        $$('.reserve-edit').on('click', function () {
            console.log("修改预约治疗时间的订单ordersno:"+$(this).data("ordersno"));
            var popupHTML = '<div class="popup reserve-popup">' +
                    '<div class="view navbar-fixed">' +
                        '<div class="pages">' +
                            '<div class="page">' +
                                '<div class="navbar">' +
                                    '<div class="navbar-inner">' +
                                        '<div class="left"><a href="#" class="link close-popup"><i class="icon icon-back"></i></a></div>' +
                                       ' <div class="center">温馨提示</div>' +
                                    '</div>' +
                               ' </div>' +
                                '<div class="page-content">' +
                                    '<p class="reserve-tip" style="margin-top:60px">由于您主动对患者治疗时间进行修改，“聚美医”不承担相关法律责任，请慎重决定！我们会主动下发通知给预约用户，请填写修改时间缘由，并确定修改的治疗时间。<p>' +
                                    '<div class="list-block">' +
                                      '<div class="list-block-title">更改的原因：</div>' +
                                      '<ul>' +
                                        '<li class="align-top">' +
                                          '<div class="item-content">' +
                                            '<div class="item-inner">' +
                                              '<div class="item-input">' +
                                                '<textarea id="reason"></textarea>' +
                                              '</div>' +
                                            '</div>' +
                                          '</div>' +
                                        '</li>' +
                                      '</ul>' +
                                    '</div>' +
                                    '<div class="list-block">' +
                                      '<div class="list-block-title">更改治疗时间为：</div>' +
                                      '<input type="text" readonly id="change-date-picker-date" class="change-date-input">' +
                                      '<div id="change-date-picker"></div>' +
                                    '</div>' +
                                    '<div class="btns">' +
                                        '<a href="#" class="link close-popup define-btn" id="modify" data-ordersno="'+$(this).data("ordersno")+'">任性，确定修改</a>' +
                                    '</div>'

            '</div>' +
        '</div>' +
    '</div>' +
'</div>' +
'</div>'
            myApp.popup(popupHTML);
            $("#modify").on("click",
                function (){
                    var ordersno = $(this).data("ordersno");
                    var reason = $("#reason").val();
                    var modifyDt =pickerInline.value.toString().replaceAll(',','-');
                    console.log("修改时间按钮ordersno:" + ordersno + '\n'
                       + "原因:" + reason+'\n'
                       + "时间:" + modifyDt);
                    //Ajxa请求修改时间
                    $.Frame.Ajax.Ajax({
                        url: "http://localhost:5401/"+"myorder.settreatdt.go",
                        postdata: {
                            ordersno: ordersno,
                            modifytreatdtreason: reason,
                            treatdt:modifyDt,
                        },
                        success: function (rtn) {
                            if (rtn.issuccess) {
                                frame.alert(rtn.msg,"正确");
                            } else {
                                frame.alert(rtn.msg,"错误");
                            }
                        }

                    });
                    

            });

            var today = new Date();

            var pickerInline = frame.picker({
                input: '#change-date-picker-date',
                container: '#change-date-picker',
                rotateEffect: true,
                toolbar: false,
                onClose: function () {
                    $$('.modal-overlay').addClass('modal-overlay-visible')
                },
                value: [today.getFullYear(), today.getMonth(), today.getDate(), '上午'],
                onChange: function (picker, values, displayValues) {
                    var daysInMonth = new Date(picker.value[2], picker.value[0] * 1 + 1, 0).getDate();
                    if (values[1] > daysInMonth) {
                        picker.cols[1].setValue(daysInMonth);
                    }
                },
                formatValue: function (p, values, displayValues) {
                    return displayValues[0] + '.' + displayValues[1] + '.' + values[2] + ' ' + values[3];
                },
                cols: [
                    // Years
                    {
                        values: (function () {
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

    }
    

    });




var pics = new Array();
frame.onPageInit("record", function () {
    console.log("record page init successfully");
        $("#uploadImage").on("click",
           function () {
               $("#inputFile").trigger("click");
               
           });
      

});


/* ============== 擅长项目 ============ */
frame.onPageInit("goodat", function () {
    console.log("goodat page initlize successfully");

    var selectedProject;
    var selectedItem;//选中的项目
    
    frame.showNavbar();
    $(".navbar-brand").removeClass("navbar-brand").addClass("navbar-inner");
    
   
    // 显示更多
    $$('.goodat-list ul').each(function () {
        $$(this).find('.view-more').nextAll().hide();
    });
    $$('.goodat-list ul li.view-more').click(function () {
        $$(this).nextAll().show();
        $$(this).remove();
    });


    //点击添加样式
    $(".goodat-list ul li").on("click", function () { 
        $(".goodat-list ul li").removeClass("active");
        $(this).toggleClass("active");
        selectedItem = $(this);
        selectedProject = $(this).parent().parent().find(".list-title");
    });


    // 点击返回，按钮提示保存
    $$('.form-back').on('click', function () {
        frame.confirm('', '是否保存编辑？',
            function () {
                //会话存储
                sessionStorage.setItem("selected", selectedItem.text() + ">" + selectedProject.text());
                console.log("sessionStorage:selected" + sessionStorage.getItem("selected"));
                mainView.router.back();
            },
            function () {
            
                mainView.router.back();
            }
        );
    });

    $$('.goodat-save').on('click', function () {
        myApp.confirm('', '是否保存编辑？',
            function () {
                sessionStorage.setItem("selected", selectedProject.text()+">"+selectedItem.text() );
                console.log("sessionStorage:selected" + sessionStorage.getItem("selected"));
                mainView.router.back();
            },
            function () {
                //会话存储

                mainView.router.back();
            }
        );
    });
});
frame.onPageBeforeRemove("goodat", function () {
    var selected = sessionStorage.getItem("selected");
    console.log(selected);
    $("#select").text(selected);

});

function previewImage(files) {
    if (files.files && files.files[0]) {

        var reader = new FileReader();
        reader.onload = function (evt) {     
            AddImgToArrayDisplay( evt.target.result);
            var oldFile1 = document.getElementById("inputFile");
            var newFile1 = oldFile1.cloneNode(true);
            oldFile1.parentNode.replaceChild(newFile1, oldFile1);
        };
        reader.readAsDataURL(files.files[0]);
       

    } else {
        console.log("File Not Found");
    }
}

function AddImgToArrayDisplay(url) {

    //limite 8 picture 
    if (pics.length < 8) {
    var img = new Image();
    img.src = url;
    img.name = img.name.substring(0, 6);//标题
    if (img.name == '') {
        img.name = "治疗照片";
    }
    $("#pic").tmpl(img).prependTo(".manyimg");
        //图片预览
    $(".minimg img").click(function () {
        var myPhotoBrowser = frame.photoBrowser({
            zoom: true,
            photos: [url],
           
            theme: "dark",
            type: "standalone",
            backLinkText:"后退"
        });
        myPhotoBrowser.open(); 
    });
    pics.push(img);
    } 
    console.log("当前图片总数:" + pics.length);

}


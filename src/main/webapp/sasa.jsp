<%--
  Created by IntelliJ IDEA.
  User: 88
  Date: 2020/7/20
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="box">
    31341

</div>

</body>
<script>
    var date = {
        one :"2020-04-12",
        two :"2020-09-02"
    }

    var data = {
        a :1,
        b :2
    }
    deepClone1(data,"")



    function deepClone1(origin, target) {
        var target = target || {};
        toStr = Object.prototype.toString, //对象调用toSting()
            arrStr = "[obect Array];"
        for(var prop in origin) {
            if(origin.hasOwnProperty(prop)) { //判断是否是原型上的属性还是自己的属性
                if(origin[prop] !== "null" && typeof(origin[prop]) == "object") { //判断是数组还是对象且复制者不能为空
                    if(toStr.call(origin[prop]) == arrStr) {
                        target[prop] = [];
                    } else {
                        target[prop] = {};
                    }
                    deepClone(origin[prop], target[prop]);
                } else {
                    target[prop] = origin[prop];　　//递归调用
                }
            }
        }
        target.a = "qq"
        console.log(target)
        console.log(origin)
        return target;
    }

  /*  deepClone(date)*/

    function deepClone(obj) {
        var copy

        // 处理3种基础类型，和null、undefined
        if (obj === null || typeof obj !== 'object') return obj

        // 处理日期
        if (obj instanceof Date) {
            copy = new Date()
            copy.setTime(obj.getTime())
            return copy
        }

        // 处理数组
        if (Array instanceof Array) {
            copy = []
            for (var i = 0, len = obj.length; i < len; i++) {
                copy[i] = deepClone(obj[i])
            }
            return copy
        }

        // 处理函数
        if (obj instanceof Function) {
            copy = function () {
                return obj.apply(this, arguemnts)
            }
            return copy
        }

        // 处理对象
        if (obj instanceof Object) {
            {
                copy = {}
                for (var attr in obj) {
                    if (obj.hasOwnProperty(attr)) copy[attr] = deepClone(obj[attr])
                }
                console.log(copy)
                return copy
            }


            throw new Error("Unable to copy obj as type isn't suported" + obj.constructor.name)
        }


        var data = {
            a: 1,
            b: 2
        }
        clone(data);

        function clone(obj) {
            let temp = null;
            if (obj instanceof Array) {
                temp = obj.concat();
            } else if (obj instanceof Function) {
                //函数是共享的是无所谓的，js也没有什么办法可以在定义后再修改函数内容
                temp = obj;
            } else {
                temp = new Object();
                for (let item in obj) {
                    let val = obj[item];
                    temp[item] = typeof val == 'object' ? clone(val) : val; //这里也没有判断是否为函数，因为对于函数，我们将它和一般值一样处理
                }
            }
            temp[1] = "qq";
            console.log(temp)
            console.log(obj)
            return temp;
        }

        let div = document.getElementById('box');
        let box2 = div.cloneNode(true);
        // console.log(div,box2);
    }
</script>
</html>

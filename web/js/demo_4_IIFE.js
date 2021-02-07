// IIFE = Immediately Invoked Function Expression

for (var i = 0; i < 10; i++) {}

// js里只有两种scope，function里和function外
// i 执行完loop依然活着，变成全局变量
i; // 10

// 所以需要一层屏障
// 就是立即执行函数(IIFE)
// 内部的变量会在用完之后被杀掉
var result2 = (function () {
    var name = "Barry";
    return name;
})();


// Immediately creates the output:
// Immediately print 'this is IIFE':

(function () {
    console.log('this is IIFE')
})();

// 这是错误写法，定义了但是没有调用
// 因为没写最后的括号
(function () {
    console.log('this is IIFE')
});

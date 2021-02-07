function guess(num, smallerCb, biggerCb, equalCb) {
    var random = Math.floor(Math.random() * 100);
    console.log(num, random);

    if (num < random) {
        smallerCb();
        return;
    } else if (num > random) {
        biggerCb();
        return;
    }
    equalCb();
}

function smaller() {
    console.log('Your num is too small');
}

function bigger() {
    console.log('Your num is too bigger');
}

function equal() {
    console.log('Your guess is right!!');
}


// --> JavaScript Hoisting:
//      运行的时候把定义前置，不会有使用的时候未定义
//      所以function顺序不对不会报错
// function()： 加括号是函数的调用
// function 是在传递函数
// 把函数当成一个参数传递进去的函数就叫callback function
// smaller, bigger, equal都是callback function
guess(18, smaller, bigger, equal);

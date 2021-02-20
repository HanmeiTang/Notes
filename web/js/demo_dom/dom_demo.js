var arr = ['apple', 'pear', 'berry'];

var oUl = document.getElementById('box');

for (var i = 0; i < arr.length; i++) {
    var oLi = document.createElement('li');
    oLi.className = 'item';
    oLi.id = arr[i];
    oLi.innerHTML = arr[i];
    oUl.append(oLi);
}
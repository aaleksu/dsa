function fibs(n) {
    if (n <= 1) {
        return n;
    }

    var left_arg = (1 + Math.sqrt(5)) / 2,
	right_arg = (1 - Math.sqrt(5)) / 2;
        	
    return Math.ceil((Math.pow(left_arg, n) - Math.pow(right_arg, n)) / Math.sqrt(5));
}

var start = new Date().getTime();
console.log(fibs(10));
var finish = new Date().getTime();
console.log(finish - start);

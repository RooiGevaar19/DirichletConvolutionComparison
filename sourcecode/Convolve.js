const {performance} = require('perf_hooks');

function f(n) {
    return 1/n;
}

function g(n) {
    return Math.sin(n);
}

function convolve(f,g,k) {
    let sum = 0.0;
    for (let i = 1; i <= k; i++) {
        //if (i < 0) break;
        if (k % i === 0) {
            sum += f(i) * g(k/i);
        }
    }
    return sum;
}

function convolve2(f,g,k) {
    let sum = 0.0;
    for (let i = 1; i*i <= k; i++) {
        //if (i < 0) break;
        if (k % i === 0) {
            sum += f(i) * g(k/i);
            if (i*i !== k) sum += f(k/i) * g(i);
        }
    }
    return sum;
}

function convolve3(f,g,k) {
    return Array
        .from(Array(k).keys())
        .map((i) => i+1)
        .filter((item) => k % item === 0)
        .reduce((sum, item) => sum + f(item) * g(k/item), 0)
}

function test1(k) {
    let start = performance.now(); 
    let a = convolve(f,g,k);
    let end = performance.now(); 
    return (end - start).toFixed(6).toString();
}

function test2(k) {
    let start = performance.now(); 
    let a = convolve2(f,g,k);
    let end = performance.now(); 
    return (end - start).toFixed(6).toString();
}

function test3(k) {
    if (k < 100000000) {
        let start = performance.now(); 
        let a = convolve3(f,g,k);
        let end = performance.now(); 
        return (end - start).toFixed(6).toString();
    } else {
        return "OffTheScale"
    }
}

var myArgs = process.argv.slice(2);

//console.log(convolve(f,g,2137))

process.stdout.write(
    test1(parseInt(myArgs[0]))
    +"\t"+test2(parseInt(myArgs[0]))
    +"\t"+test3(parseInt(myArgs[0]))
);
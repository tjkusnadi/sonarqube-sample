const lodash = require('lodash');

console.log('Lodash version:', lodash.VERSION);

function add(a, b) {
    return a + b;
}

console.log('2 + 3 =', add(2, 3));

module.exports = { add };

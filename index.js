var add = require('./add.js')().exports.add
console.log(add(1, 2))

var upper = require('./upper.js')
var wasm = upper()
var buf = Buffer.from('hello, world!')
wasm.memory.set(buf)
wasm.exports.upper(0, buf.length)
var output = Buffer.from(wasm.memory.subarray(0, buf.length))
console.log(output.toString())

Array.prototype.sample = function() {
    return this[Math.floor(Math.random() * this.length)]
}

Number.prototype.times = function(fn) {
    var i;
    for (i = 0; i < this; i++) {
        fn();
    }
}

Object.prototype.sample = function(n) {
    n = typeof n !== undefined ? n : 1

    var rest = this.dup()

    // Avoid 'undefined' item when requesting more items than available
    if (n > Object.keys(rest).length) {
        n = Object.keys(rest).length
    }

    var res = {}
    n.times(function () {
        var k = Object.keys(rest).sample()
        res[k] = rest[k]

        delete rest[k]
    })

    return res
}

Object.prototype.dup = function () {
    return JSON.parse(JSON.stringify(this))
}

Object.prototype.swap = function() {
    var obj = this
    var res = {}
    Object.keys(this).forEach(function(e) {
      res[obj[e]] = e
    })
    return res
}


function banker() {
    const max = [753, 322, 902, 222, 433];
    const allocation = [10, 200, 302, 211, 2];
    let available = 332;
    const need = max.map((e, i) => e - allocation[i]);

    let proc = need.map((e, i) => e <= available ? available += allocation[i] : false);
    const mask = proc.map((e) => e ? true : false);
    let result = proc;
    proc = need.map((e, i) => !mask[i] ? e <= available ? available += allocation[i] : false : false);
    return [result.map((e, i) => e ? i : false)
                 .filter(e => e)
                 .concat(proc.map((e, i) => e ? i : false)
                 .filter(e => e !== false)),
                 proc.reduce((e, i) => Math.max(e, i))]
}
console.log(banker())

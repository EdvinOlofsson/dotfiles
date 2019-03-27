// Pretty print of the npm package 'deep-diff'.
// Work in Progress
const prettyDiff = (a, b) => {
    const result = diff(a, b);
    if (result) {
        return JSON.stringify(result.map((d) => {
            if (d.kind === 'E') {
                return `${d.path[0]}: ${d.lhs} -> ${d.rhs}`;
            } else if (d.kind === 'A') {
                if (d.item) {
                    return `${d.path[0]}(${d.item.kind}): ${JSON.stringify(d.item.lhs, undefined, 2)}`;
                }
            }
            console.warn('d: ', d);
            return d;
        }), undefined, 2);
    }
    return result;
};

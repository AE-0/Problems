// https://godbolt.org/z/ETzjE1aEb
pub fn banker() -> Vec<usize> {
    let max = vec![753, 322, 902, 222, 433];
    let allocation = vec![10, 200, 302, 211, 2];
    let mut available = 332;

    let need: Vec<_> = max.iter()
            .zip(allocation.iter())
            .map(|(&e, &i)| e - i)
            .collect();

    let mut proc: Vec<_> = need.iter()
            .enumerate()
            .map(|(i, &e)| if e <= available { available += allocation[i]; available } else { 0 })
            .collect();

    let mask: Vec<_> = proc.iter()
            .map(|e| if e > &0 { true } else { false })
            .collect();
    
    let result = proc.clone();

    proc = need.iter()
            .enumerate()
            .map(|(i, &e)| {
                if !mask[i] && e <= available { available += allocation[i]; available }
                else { 0 } })
            .collect();

    let indexes: Vec<_> = result.iter()
            .enumerate()
            .filter(|(_, &e)| e > 0 )
            .map(|(i, _)| i)
            .collect();

    let indexes2: Vec<_> = proc.iter()
            .enumerate()
            .filter(|(_, &e)| e > 0 )
            .map(|(i, _)| i)
            .collect();

    [&indexes[..], &indexes2[..]].concat()
}

pub fn main() {
    println!("{:?}", banker());
}

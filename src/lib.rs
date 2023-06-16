use monero_serai::{
    wallet::{
        seed::{
            Seed, Language
        },
    },
};

use rand_core::OsRng; // for generating a seed
use zeroize::{Zeroizing};
use std::os::raw::{c_char};
use std::ffi::CString;

#[no_mangle] pub extern "C" fn generate_seed() -> *const c_char { // TODO rename fn to be more in line with other libs/impls
    convert_zeroize_string_to_c_string(&Seed::to_string(&Seed::new(&mut OsRng, Language::English)))
     // TODO add lang as param
}

fn convert_zeroize_string_to_c_string(zeroized_string: &Zeroizing<String>) -> *const c_char {
    // Convert the zeroized string to a normal string
    let rust_string = zeroized_string.as_str();

    // Convert the string to a CString
    let c_string = CString::new(rust_string).expect("Failed to create CString");

    // Convert the CString to a raw pointer
    let raw_ptr = c_string.into_raw();

    let const_ptr = raw_ptr as *const c_char;

    // Return the raw pointer
    const_ptr
}

// TODO remove this example fn
pub fn add(left: usize, right: usize) -> usize {
    left + right
}

#[cfg(test)]
mod tests {
    use super::*;

    // TODO update tests to use real fns
    #[test]
    fn it_works() {
        let result = add(2, 2);
        assert_eq!(result, 4);
    }
}

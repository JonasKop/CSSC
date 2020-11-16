use std::{str, iter};
use std::env;
use regex::Regex;
use std::process::exit;
use std::num::ParseIntError;

fn error_exit() {
    eprintln!("Usage: (cssc 223344) for HEX or (cssc 230 45 230) for RGB");
    exit(1);
}

fn parse_colors(args: Vec<String>) -> Result<(bool, Vec<u8>), String> {
    let hex_regex = Regex::new(r"^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{4}|[0-9a-fA-F]{6}|[0-9a-fA-F]{8})$").unwrap();
    let rgb_regex = Regex::new(r"^rgb\(.*\)$").unwrap();
    let rgba_regex = Regex::new(r"^rgba\(.*\)$").unwrap();

    match args.len() {
        1 => match () {
            _ if hex_regex.is_match(args[0].as_str()) => parse_hex(args[0].clone()).and_then(|e| Ok((true, e))),
            _ if rgb_regex.is_match(args[0].as_str()) => parse_rgb(args[0].clone()).and_then(|e| Ok((false, e))),
            _ if rgba_regex.is_match(args[0].as_str()) => parse_rgba(args[0].clone()).and_then(|e| Ok((false, e))),
            _ => Err(String::from("Invalid argument"))
        },
        3 | 4 => parse_rgb_array(args).and_then(|e| Ok((false, e))),
        _ => Err(String::from("Invalid argument"))
    }
}

fn validate_vec_len(colors: (bool, Vec<u8>)) -> Result<(bool, Vec<u8>), String> {
    match (3..5).contains(&colors.1.len()) {
        true => Ok(colors),
        false => Err(String::from("Invalid argument size")),
    }
}

fn double_chars(s: String) -> String {
    s.chars().flat_map(|c| iter::repeat(c).take(2)).collect::<String>()
}

fn chunk_string(s: String) -> Vec<String> {
    s.as_bytes()
        .chunks(2)
        .map(str::from_utf8)
        .collect::<Result<Vec<&str>, _>>().unwrap().iter().map(|&e| { String::from(e) }).collect()
}

fn parse_hex(hex: String) -> Result<Vec<u8>, String> {
    let pretty = match hex.chars().nth(0).unwrap() == '#' {
        true => String::from(&hex[1..]),
        false => hex,
    };
    let chunks = match (3..5).contains(&pretty.len()) {
        true => chunk_string(double_chars(pretty)),
        false => chunk_string(pretty),
    };
    chunks.iter()
        .map(|e| { u8::from_str_radix(e, 16) })
        .collect::<Result<Vec<u8>, ParseIntError>>()
        .map_err(|_| { String::from("Could not parse as 8 bit unsigned int") })
}

fn parse_rgb_array(args: Vec<String>) -> Result<Vec<u8>, String> {
    args
        .iter()
        .map(|e| { e.trim().parse::<u8>() })
        .collect::<Result<Vec<u8>, ParseIntError>>()
        .map_err(|_| { String::from("Could not parse as 8 bit unsigned int") })
}

fn parse_rgb(rgb: String) -> Result<Vec<u8>, String> {
    parse_rgb_array(rgb[4..(rgb.len() - 1)]
        .split(",")
        .map(|e| { String::from(e) })
        .collect::<Vec<String>>()
    )
}

fn parse_rgba(rgb: String) -> Result<Vec<u8>, String> {
    parse_rgb_array(rgb[5..(rgb.len() - 1)]
        .split(",")
        .map(|e| { String::from(e) })
        .collect::<Vec<String>>()
    )
}

fn format_rgb(colors: Vec<u8>) -> String {
    let formatted = colors
        .iter()
        .map(|e| { String::from(e.to_string()) })
        .collect::<Vec<String>>().join(", ");
    format!("rgb({})", formatted)
}

fn format_rgba(colors: Vec<u8>) -> String {
    let formatted = &colors[..3]
        .iter()
        .map(|e| { String::from(e.to_string()) })
        .collect::<Vec<String>>();
    let alpha = format!("{:.2}", ((colors[3] as f32) / (255 as f32)));
    let fin: Vec<String> = [&formatted[..], &vec![alpha]].concat();
    format!("rgba({})", fin.join(", "))
}

fn format_hex(colors: Vec<u8>) -> String {
    let formatted: String = colors
        .iter()
        .map(|e| { String::from(format!("{:0>2}", format!("{:X}", e))) })
        .collect();
    format!("#{}", formatted)
}

fn format_printable(print_rgb: bool, colors: Vec<u8>) -> String {
    match print_rgb {
        true => match colors.len() {
            3 => format_rgb(colors),
            4 => format_rgba(colors),
            _ => String::from("")
        },
        false => format_hex(colors)
    }
}

fn main() {
    let args: Vec<String> = env::args().skip(1).collect();
    if args.is_empty() { error_exit() };
    let maybe_colors = parse_colors(args).and_then(validate_vec_len);
    match maybe_colors {
        Ok((print_rgb, colors)) => print!("{}", format_printable(print_rgb, colors)),
        _ => error_exit(),
    }
}

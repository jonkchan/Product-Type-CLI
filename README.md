# Product Type Command Line Interface (CLI)

The Product Type CLI takes in a required product type argument and optional product option argument(s) to return available product type options.

## Installation

Run the following command within the terminal to install the required gems

```bash
bundle install
```

## Usage

Run the following command within the terminal to start the CLI program.
The results of the CLI will then be displayed on the terminal.

Notes:

- `product_type` argument is required
- `product_option` argument is optional

```bash
ruby bin/run product_type product_option
```

To update the products JSON data, provide the new JSON file under the `./json/` directory and name the file `products.json`.

## Example Input / Output

Example 1

- Options for tshirt `product_type`

```
> ruby bin/run tshirt
Gender: male, female
Color: red, blue, green
Size: small, medium, large, extra-large, 2x-large
```

- Options for tshirt `product_type` & female gender `product_option`

```
> ruby bin/run tshirt female
Color: red, blue, green
Size: small, medium, large, extra-large, 2x-large
```

- Options for tshirt `product_type` & female gender `product_option` & red color `product_option`

```
> ruby bin/run tshirt female red
Size: small, medium, large, extra-large, 2x-large
```

Example 2

- Options for sticker `product_type`

```
> ruby bin/run sticker
Size: x-small, small, medium, large, x-large
Style: matte, glossy
```

- Options for sticker `product_type` & small size `product_option`

```
> ruby bin/run sticker small
Style: matte
```

# Testing

Run the following command within the terminal to start automated testing

```bash
rspec
```

## License

This CLI implementation is available as open source under the terms of the [MIT License](https://choosealicense.com/licenses/mit/).

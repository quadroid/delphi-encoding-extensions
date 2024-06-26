TEncodingEx
===========

Delphi `TEncoding` extensions and improvements:

  * UTF-8 encoding derived from `TMBCSEncoding` instead of `TUTF7Encoding`. (There really isn’t much common between UTF-8 and UTF-7.)
  * Additional UTF-8 encoder that doesn’t write byte order mark.
  * Minor improvement to UTF-16 big-endian encoding class.
  * UTF-32 encoders / decoders (both little- and big-endian).
  * [IMultiLanguage2](https://learn.microsoft.com/en-us/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa741001(v=vs.85)) encoding interface via `TMLangEncoding`.
  * Implementation of a hexadecimal binary encoding.
  * New, more complete, encoding detection function.

## Support

If you like TEncodingEx, you can [send](https://www.buymeacoffee.com/quadroid "Donate") me a 🍩

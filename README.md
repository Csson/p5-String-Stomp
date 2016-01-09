# NAME

String::Stomp - Removes empty leading and trailing lines

![Requires Perl 5.10.1](https://img.shields.io/badge/perl-5.10.1-brightgreen.svg) [![Travis status](https://api.travis-ci.org/Csson/p5-String-Stomp.svg?branch=master)](https://travis-ci.org/Csson/p5-String-Stomp)

# VERSION

Version 0.0102, released 2016-01-09.

# SYNOPSIS

    use String::Stomp;

    sub out {
        print stomp q{
            A short
            text
        };
    }

    # is exactly the same as
    sub out {
        print q{        A long
            text.};
    }

# DESCRIPTION

String::Stomp provides `stomp`, a simple function that removes all leading and trailing lines that only consist of white space or line breaks.

## FUNCTIONS

### stomp $string

    # '        hello'
    my $string = stomp q{
        hello
    };

## MORE EXAMPLES

### Usage with [qs](https://metacpan.org/pod/Syntax::Feature::Qs)

[Syntax::Feature::Qs](https://metacpan.org/pod/Syntax::Feature::Qs) adds `qs` and `qqs` that removes all leading whitespace from all lines in a string:

    # these three packages are equivalent:
    package Example::Stomp {

        use String::Stomp;
        use syntax 'qs';

        sub out {
            print stomp qs{
                This is
                a multi line

                string.
            };
        }
    }
    package Example::Q {

        sub out {
            print q{This is
    a multi line

    string.};
        }
    }
    package Example::HereDoc {

        sub out {

            (my $text = <<"            END") =~ s{^ {12}}{}gm;
                This is
                a multi line

                string.
            END
            
            $text =~ s{\v\z}{};
            print $text;
        }
    }

# SEE ALSO

- [String::Trim::More](https://metacpan.org/pod/String::Trim::More)
- [String::Util](https://metacpan.org/pod/String::Util)
- [qi](https://metacpan.org/pod/Syntax::Feature::Qs)

# SOURCE

[https://github.com/Csson/p5-String-Stomp](https://github.com/Csson/p5-String-Stomp)

# HOMEPAGE

[https://metacpan.org/release/String-Stomp](https://metacpan.org/release/String-Stomp)

# AUTHOR

Erik Carlsson <info@code301.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by Erik Carlsson.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

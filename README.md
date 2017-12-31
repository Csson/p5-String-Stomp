# NAME

String::Stomp - Removes empty leading and trailing lines

<div>
    <p>
    <img src="https://img.shields.io/badge/perl-5.10.1+-blue.svg" alt="Requires Perl 5.10.1+" />
    <a href="https://travis-ci.org/Csson/p5-String-Stomp"><img src="https://api.travis-ci.org/Csson/p5-String-Stomp.svg?branch=master" alt="Travis status" /></a>
    <a href="http://cpants.cpanauthors.org/release/CSSON/String-Stomp-0.0103"><img src="http://badgedepot.code301.com/badge/kwalitee/CSSON/String-Stomp/0.0103" alt="Distribution kwalitee" /></a>
    <a href="http://matrix.cpantesters.org/?dist=String-Stomp%200.0103"><img src="http://badgedepot.code301.com/badge/cpantesters/String-Stomp/0.0103" alt="CPAN Testers result" /></a>
    <img src="https://img.shields.io/badge/coverage-100.0%-brightgreen.svg" alt="coverage 100.0%" />
    </p>
</div>

# VERSION

Version 0.0103, released 2017-12-31.

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
        print q{        A short
            text};
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
- [qs](https://metacpan.org/pod/Syntax::Feature::Qs)
- [qi](https://metacpan.org/pod/Syntax::Feature::Qi)

# SOURCE

[https://github.com/Csson/p5-String-Stomp](https://github.com/Csson/p5-String-Stomp)

# HOMEPAGE

[https://metacpan.org/release/String-Stomp](https://metacpan.org/release/String-Stomp)

# AUTHOR

Erik Carlsson <info@code301.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2016 by Erik Carlsson.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

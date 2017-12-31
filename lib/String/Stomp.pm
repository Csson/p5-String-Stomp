use 5.10.1;
use strict;
use warnings;
package String::Stomp;

our $VERSION = '0.0104';
# ABSTRACT: Removes empty leading and trailing lines
# AUTHORITY

use Exporter 'import';
our @EXPORT = qw/stomp/;

sub stomp($) {
    my $string = shift;

    $string =~ s{\A[\h\v]*\v(?=\h*[^\h\v])}{};
    $string =~ s{([^\h\v]\V*)\v[\h\v]*\z}{$1};

    return $string;
}

1;


=encoding utf-8

=head1 SYNOPSIS

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


=head1 DESCRIPTION

String::Stomp provides C<stomp>, a simple function that removes all leading and trailing lines that only consist of white space or line breaks.

=head2 FUNCTIONS

=head3 stomp $string

    # '        hello'
    my $string = stomp q{
        hello
    };

=head2 MORE EXAMPLES

=head3 Usage with L<qs|Syntax::Feature::Qs>

L<Syntax::Feature::Qs> adds C<qs> and C<qqs> that removes all leading whitespace from all lines in a string:

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

=head1 SEE ALSO

=for :list
* L<String::Trim::More>
* L<String::Util>
* L<qs|Syntax::Feature::Qs>
* L<qi|Syntax::Feature::Qi>


=cut

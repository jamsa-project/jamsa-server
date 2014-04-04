package JamsaServer;
use Dancer ':syntax';
use Dancer::Serializer::JSON;

our $VERSION = '0.1';

set serializer => 'JSON';

get '/' => sub {
    template 'index';
};

get '/:id' => sub {
    my $id = params->{id};
    return { id => $id, command => "speech", data => "" };
};

true;

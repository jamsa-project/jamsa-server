package JamsaServer;
use Dancer ':syntax';
use Dancer::Serializer::JSON;
use YAML;

my $FILES_PATH="/home/jamsa/files";

our $VERSION = '0.1';

set serializer => 'JSON';

get '/' => sub {
    template 'index';
};

get '/:id' => sub {
    my $id = params->{id};
    # Try to open the file $FILES_PATH/$id.yaml
    my $status = 0;
    open my $FILE, '<', "$FILES_PATH/$id.yaml" or $status = -1;
    # Read the file
    my $content = YAML::LoadFile($FILE);
    # TODO: Check is a valid YAML file
    # Convert YAML to JSON and return it
    $content->{"id"} = $id;
    $content->{"status"} = $status;
    return ($content);
};

true;

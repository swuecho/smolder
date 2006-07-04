package Smolder::Control::DocSearch;
use base 'CGI::Application::Search';
use Smolder::Conf qw(InstallRoot);
use File::Spec::Functions qw(catfile catdir);
use Apache::Constants qw(OK);

sub handler : method {
    my ($class, $r) = @_;
    $r->no_cache(1);
    my $controller = $class->new();
    $controller->run();
    return OK;
}

sub cgiapp_init {
    my $self = shift;
    $self->param(
        SWISHE_INDEX        => catfile(InstallRoot, 'data', 'doc_search', 'swishe.index'),
        TEMPLATE            => catfile(InstallRoot, 'templates', 'DocSearch', 'search.tmpl'),
        AJAX                => 1,
        TEMPLATE_TYPE       => 'TemplateToolkit',
        HIGHLIGHT_CLASS     => 'hilite',
        AUTO_SUGGEST        => 1,
        AUTO_SUGGEST_FILE   => catfile(InstallRoot, 'data', 'doc_search', 'swishe.words'),
        AUTO_SUGGEST_CACHE  => 1,
        AUTO_SUGGEST_LIMIT  => 10,
        DOCUMENT_ROOT       => catfile(InstallRoot, 'htdocs'),
    );
}

1;

isEmpty(PREFIX) {
  PREFIX = /usr/local
}

TEMPLATE = aux

QMAKE_RESOURCE_FLAGS += -root .

# Install

#install_resources.path = $$PREFIX/share/isu/
install_resources.path = /usr/share/youker-assistant/
install_resources.files = .
INSTALLS = install_resources

RESOURCES +=

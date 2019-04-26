// Creates the timeago instance, and collects all <relative-time> elements.
var timeagoInstance = timeago(),
	nodes = document.getElementsByTagName('relative-time');

// Converts them all!
timeagoInstance.render(nodes);

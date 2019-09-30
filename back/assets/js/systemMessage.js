
var sysMessage = (function() {
	var dataModel = {
		text: '',
		importance: 0,
		_msgBox: null
	}

	function init() {
		_msgBox = document.getElementsByTagName('messageBox')[0];
	}

	function set(_text, _importance = 0) {
		dataModel.text = _text;
		dataModel.importance = _importance;
	}

	function render() {
		var output = '';
		var dfltAlertType = 'alert-info';

		if (dataModel.text.length) {
			switch (dataModel.importance) {
				case 1: dfltAlertType = 'alert-success'; break;
				case 2: dfltAlertType = 'alert-warning'; break;
				case 3: dfltAlertType = 'alert-danger'; break;
			}

			output = '<div class="alert ' + dfltAlertType + '" role="alert">' + dataModel.text + '</div>';
		}

		_msgBox.innerHTML = output;
		_msgBox.style.display = dataModel.text.length? 'block' : 'hidden';
	}

	return {
		init: init,
		set: set,
		render: render
	}
})();
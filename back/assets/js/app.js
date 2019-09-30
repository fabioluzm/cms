function deleteIt(frmName) {
	if (!confirm('Are you sure you want to delete this item?'))
		return;

	frmName.action.value = 0;
	frmName.submit();
}

function changeFormAction(frmName, action, confirmMsg) {
	if (confirmMsg) {
		if (!confirm(confirmMsg))
			return;
	}

	frmName.action.value = action;
	frmName.submit();
}

function trimFormFields(frmName) {
	var elemsCount = frmName.elements.length;
	var skipElemsType = 'hidden,button,submit,file,select-one';

	for (var i = 0; i < elemsCount; i++) {
		var currEl = frmName.elements[i];

		if (skipElemsType.indexOf(currEl.type) == -1) {
			currEl.value = currEl.value.trim();
		}
	}
}

function setupTimePicker(objId, dfltOptions) {
	var $obj = $('#' + objId);

	dfltOptions.now = $obj.val().length? $obj.val() : '00:00';

	$obj.wickedpicker(dfltOptions);
}

function goPage(link) {
	window.open(link, "_self");
}


document.addEventListener("DOMContentLoaded", function() {
	var form = document.querySelector('.needs-validation');

	if (form != null) {
		//autofocus nos campos "Nome de ___" e corre
		//a função que verifica se os campos estão preenchidos
		$('input[name*="Name"],input[name="sysAddress"],input[name="imgLabel"]').focus();

		form.addEventListener('submit', function(event) {
			if (form.checkValidity() === false) {
				event.preventDefault();
				event.stopPropagation();
			}
			form.classList.add('was-validated');
		})
/*
		$('#artDesc').summernote({
			lang: 'pt-PT',		// set language of the editor
			height: 300,     // set the height of the editor
			placeholder: 'Add the article description...' // set the placeholder of the editor
		});
*/
	}

	// ao clicar no menu hamburguer ativa o movimento do layout

	$('.toggle-menu').on('click', function () {
		$('aside, main, nav, footer, .toggle-menu').toggleClass('active');
	});
})

function openTab(evt, tabName) {
    var i, tabcontent, tablinks;
    
    tabcontent = document.getElementsByClassName("tabcontent");
    tablinks = document.getElementsByClassName("tablinks");
    
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    
    document.getElementById(tabName).style.display = "block";
    
    evt.currentTarget.className += " active";
}
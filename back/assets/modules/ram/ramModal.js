/*
*	When instancing this function need to pass a struct with the following mandatory fields
*
*/

var modalSystem = {
	init:  function(modalParams) {
		var modalError = 0,
			key = '',
			defaultParams = {
				modalId: 'generalIdmodal',
				classSizeModal: 'modal-lg',
				headerCss: '',
				headerTitle: '',
				headerTitleCss: 'modal-title',
				iconCloseHeader: true,
				modalContent: '',
				footerDisplay: false,
				footerCss: '',
				footerBtnClose: true,
				footerBtnCloseFunc: '',
				footerBtnCloseText: 'Close',
				footerButtons: []
			};

			/*
			footerButtonsHtmlCode: [{
					btnId: 'testing01',
					btnClass: 'testing01',
					btnFunc: 'testing01',
					btnTextShow: 'testing01'
				},
				{
					btnId: 'testing02',
					btnClass: 'testing02',
					btnFunc: 'testing02',
					btnTextShow: 'testing02'
				}]
			*/

		for (key in modalParams) {
			if (key in defaultParams) {
				defaultParams[key] = modalParams[key];
			} else {
				modalError = 1;
				alert('key not defined on object. Please review what you are doing');
				break;
				return 1
			}
		};

		return defaultParams;
	},

	createModal: function(params) {
		var modalParams = modalSystem.init(params),
			tmpModalHtmlCode = modalSystem.headerModalBuild(modalParams) + modalParams.modalContent + modalSystem.footerModalBuild(modalParams);

		if ($('#' + modalParams.modalId).length)
			return false;

		$('body').append(tmpModalHtmlCode);

		$('#' + modalParams.modalId).modal('show');

		$('#' + modalParams.modalId).on('hidden.bs.modal', function (e) {
			modalSystem.killModal(modalParams.modalId);
		});

    $('#' + modalParams.modalId).on('shown.bs.modal', function (e) {
			var formModal = $("#savePasswordModal").find("form").attr("id");

			$('#' + formModal).submit(function(e) {
				e.preventDefault();
			});
		});
	},

	headerModalBuild: function(modalParams) {
		var tmpHeaderHtmlCode = '<DIV ID="' + modalParams.modalId + '" CLASS="modal fade" ROLE="dialog" data-backdrop="static" data-keyboard="false">' +
									'<DIV CLASS="modal-dialog ' + modalParams.classSizeModal + '" role="document">' +
										'<DIV CLASS="modal-content">' +
											'<DIV CLASS="modal-header ' + modalParams.headerCss + '">' +
												'<H4 CLASS="' + modalParams.headerTitleCss + '"><i class="fa fa-key"></i>' + modalParams.headerTitle + '</H4>';

						if (modalParams.iconCloseHeader)
							tmpHeaderHtmlCode += '<BUTTON TYPE="button" ID="closeModalButtonHeader" CLASS="close" DATA-DISMISS="modal" ARIA-HIDDEN="true">&times;</button>';

						tmpHeaderHtmlCode += '</DIV>' +

											'<DIV CLASS="modal-body">';

		return tmpHeaderHtmlCode;
	},

	footerModalBuild: function(modalParams) {
		var	tmpFooterHtmlCode = '</DIV>';

		if (modalParams.footerDisplay) {
			tmpFooterHtmlCode += '<DIV ID="' + modalParams.modalId + '_Footer" CLASS="modal-footer ' + modalParams.footerCss + '">';
								if (modalParams.footerBtnClose) {
									tmpFooterHtmlCode += '<BUTTON TYPE="button" ID="' + modalParams.modalId + '_CloseBtn" CLASS="btn btn-default  gttCstPortalBtn H1Bkg H1TextA ' + modalParams.footerBtnCss + '" POPOVERCONTAINER="' + modalParams.modalId + '_Footer" DATA-DISMISS="modal" ONCLICK="' + modalParams.footerBtnCloseFunc + '">' + modalParams.footerBtnCloseText + '</BUTTON>';
								}

								if (modalParams.footerButtons.length) {
									modalParams.footerButtons.forEach( function(item) {
										tmpFooterHtmlCode += '<BUTTON TYPE="button" ID="' + item.btnId + '" POPOVERCONTAINER="' + modalParams.modalId + '_Footer" CLASS="btn ' + item.btnClass + ' gttCstPortalBtn H1Bkg H1TextA" ONCLICK="' + item.btnFunc + '">' + item.btnTextShow + '</BUTTON>';
									});
								}
			tmpFooterHtmlCode += '</DIV>';
		}

		tmpFooterHtmlCode += '</DIV>' +
						'</DIV>' +
					'</DIV>';

		return tmpFooterHtmlCode;
	},

	killModal: function(modalId) {
		$('#' + modalId).remove();
	}
}
/*
*	When instancing this function need to pass a struct with the following mandatory fields
*
*/
var searchComponents = {
	defaultParams: {
		origin: "",
		nbrRecords: 10,
		classSizeModal: 'modal-lg',
		iconCloseHeader: true,
		footerDisplay: false,
		ajaxLink: "",
		formModal: "searchFormModal",
		modalId: "searchModal",
		modalContent: "",
		headerTitle: "Search modal",
		searchQuery: "",
		page: 1,
		minLimit: 0,
		maxLimit: 0,
		dataTotal: 0

	},

	init: function() {
		var $ramSearchElement = $("ramsearch");

		if (!$ramSearchElement.length)
			return;

		//check if there is changes to default
		searchComponents.defaultParams['origin'] = $ramSearchElement.attr('origin') != undefined ? $ramSearchElement.attr('origin') : searchComponents.defaultParams['origin'];
		searchComponents.defaultParams['nbrRecords'] = $ramSearchElement.attr('nbrRecords') != undefined ? $ramSearchElement.attr('nbrRecords') : searchComponents.defaultParams['nbrRecords'];
		searchComponents.defaultParams['classSizeModal'] = $ramSearchElement.attr('classSizeModal') != undefined ? $ramSearchElement.attr('classSizeModal') : searchComponents.defaultParams['classSizeModal'];
		searchComponents.defaultParams['iconCloseHeader'] = $ramSearchElement.attr('iconCloseHeader') != undefined ? $ramSearchElement.attr('iconCloseHeader') : searchComponents.defaultParams['iconCloseHeader'];
		searchComponents.defaultParams['ajaxLink'] = $ramSearchElement.attr('ajaxLink') != undefined ? $ramSearchElement.attr('ajaxLink') : searchComponents.defaultParams['ajaxLink'];
		searchComponents.defaultParams['formModal'] = $ramSearchElement.attr('formModal') != undefined ? $ramSearchElement.attr('formModal') : searchComponents.defaultParams['formModal'];
		searchComponents.defaultParams['modalId'] = $ramSearchElement.attr('modalId') != undefined ? $ramSearchElement.attr('modalId') : searchComponents.defaultParams['modalId'];
		searchComponents.defaultParams['headerTitle'] = $ramSearchElement.attr('headerTitle') != undefined ? $ramSearchElement.attr('headerTitle') : searchComponents.defaultParams['headerTitle'];
		searchComponents.defaultParams['modalContent'] = '<form id="searchFormModal">' + $ramSearchElement.html() + '</form>';

		if (searchComponents.defaultParams['modalContent'] == "")
			return

		searchComponents.changePage(1);
	},
	showResults: function(objectInfo) {
		var searchContent = $('ramSearchResults').html();

		Mustache.parse(searchContent);
		var rendered = Mustache.render(searchContent, objectInfo);

		rendered += searchComponents.createpagination(searchComponents.defaultParams.page, searchComponents.defaultParams.minLimit, searchComponents.defaultParams.maxLimit, searchComponents.defaultParams.dataTotal);

		$('#ramSearchResultsContainer').html(rendered);

		searchComponents.stringToHtml()
	},
	showModal: function() {
		var modalParams = {
			modalId: searchComponents.defaultParams.modalId,
			modalContent: searchComponents.defaultParams.modalContent,
			headerTitle: searchComponents.defaultParams.headerTitle,
			footerDisplay: searchComponents.defaultParams.footerDisplay
		};

		modalSystem.createModal(modalParams);
	},
	searchAjax: function(params) {
		var ajaxLink = searchComponents.defaultParams.ajaxLink;

		params += '&origin=' + searchComponents.defaultParams.origin;

		$.get(ajaxLink, params, function(res, textStatus, xhr) {
			if (res.total > 0) {
				searchComponents.defaultParams.dataTotal = res.total;
				if (searchComponents.defaultParams.dataTotal <= searchComponents.defaultParams.maxLimit)
					searchComponents.defaultParams.maxLimit = searchComponents.defaultParams.dataTotal;
				searchComponents.showResults(res);
			} else {
				var tempTextInfo = '<div class="row">' +
										'<div class="col">' +
											'<div class="alert alert-info">' +
												'Não obteve resultados' +
											'</div>' +
										'</div>' +
									'</div>';
				$('#ramSearchResultsContainer').html(tempTextInfo);
			}
		}, 'json');
	},
	changePage: function (page, origin) {
		var limit = searchComponents.defaultParams.nbrRecords,
			maxLimit = page * limit,
			minLimit = maxLimit - limit,
			params = 'page=' + page + '&limit=' + limit + '&minLimit=' + minLimit

		if (origin == 'fromModal') {
			searchComponents.defaultParams.searchQuery = $('#' + searchComponents.defaultParams.formModal).serialize()
			params += '&' + searchComponents.defaultParams.searchQuery;
		}

		searchComponents.defaultParams.page = page;
		searchComponents.defaultParams.minLimit = minLimit;
		searchComponents.defaultParams.maxLimit = maxLimit;

		searchComponents.searchAjax(params);
	},
	createpagination: function(page, minLimit, maxLimit, dataTotal) {
		var pagesHtml = '<div class="row">' +
							'<div class="col">' +
								'<ul class="pagination justify-content-center">' +
											'<li class="page-item';

								if (page == 1) {
									pagesHtml += ' disabled"><a';
								} else {
									pagesHtml += '"><a id="nextPaginationSearch" onclick="searchComponents.changePage(' + (page - 1) + ');"';
								}

								pagesHtml += ' href="#" tabindex="-1" class="page-link"><span aria-hidden="true">&laquo;</span></a></li>' +
											'<li class="page-item disabled"><a href="#" tabindex="-1" class="page-link"> ' + (minLimit + 1) + ' - ' + maxLimit + ' ' + 'de' + ' ' + dataTotal + ' </li>' +
											'<li class="page-item ';

							if (maxLimit == dataTotal) {
								pagesHtml += ' disabled"><a';
							} else {
								pagesHtml += '"><a id="nextPaginationSearch" onclick="searchComponents.changePage(' + (page + 1) + ');"';
							}

					pagesHtml += ' href="#" tabindex="-1" class="page-link"><span aria-hidden="true">&raquo;</span></a></li>' +
								'</ul>' +
							'</div>' +
						'</div>';
			return pagesHtml;
	},
	stringToHtml: function() {
		var $descriptionsFieldsSearch = $('.descriptionCleaner');

		$('.descriptionCleaner').each(function() {
			var $this = $(this);

			$this.html($this.text());
		});
	}
}

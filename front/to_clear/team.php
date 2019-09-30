<?php

//image -> URL -> description -> descriptionOtherLang

$teamData = array(

	array(
		'image' => 'img/team/tiago.jpg',

		'pt' => array(
			'imageTitle' => 'Tiago Reis - Fundador/Programador',
			'imageAlt' => 'Tiago Reis',
			'name' => 'Tiago Reis',
			'job' => 'Fundador/Programador'
		),
		'en' => array(
			'imageTitle' => 'Tiago Reis - Co-Founder/Developer',
			'imageAlt' => 'Tiago Reis',
			'name' => 'Tiago Reis',
			'job' => 'Co-Founder/Developer'
		),
	),
	array(
		'image' => 'img/team/antonio.jpg',

		'pt' => array(
			'imageTitle' => 'António Marreiros - Fundador/Programador',
			'imageAlt' => 'António Marreiros',
			'name' => 'António Marreiros',
			'job' => 'Fundador/Programador'
		),
		'en' => array(
			'imageTitle' => 'António Marreiros - Co-Founder/Developer',
			'imageAlt' => 'António Marreiros',
			'name' => 'António Marreiros',
			'job' => 'Co-Founder/Developer'
		),
	),
	array(
		'image' => 'img/team/noemia.jpg',

		'pt' => array(
			'imageTitle' => 'Noémia Reis - Gestora de Projectos',
			'imageAlt' => 'Noémia Reis',
			'name' => 'Noémia Reis',
			'job' => 'Gestora de Projectos'
		),
		'en' => array(
			'imageTitle' => 'Noémia Reis - Project Manager',
			'imageAlt' => 'Noémia Reis',
			'name' => 'Noémia Reis',
			'job' => 'Project Manager'
		),
	),
	array(
		'image' => 'img/team/bruno.jpg',

		'pt' => array(
			'imageTitle' => 'Bruno Cunha - Administrador de Sistemas',
			'imageAlt' => 'Bruno Cunha',
			'name' => 'Bruno Cunha',
			'job' => 'Administrador de Sistemas'
		),
		'en' => array(
			'imageTitle' => 'Bruno Cunha - System Administrator',
			'imageAlt' => 'Bruno Cunha',
			'name' => 'Bruno Cunha',
			'job' => 'System Administrator'
		),
	),
	array(
		'image' => 'img/team/richard.jpg',

		'pt' => array(
			'imageTitle' => 'Richard Pacheco - Programador',
			'imageAlt' => 'Richard Pacheco',
			'name' => 'Richard Pacheco',
			'job' => 'Programador'
		),
		'en' => array(
			'imageTitle' => 'Richard Pacheco - Developer',
			'imageAlt' => 'Richard Pacheco',
			'name' => 'Richard Pacheco',
			'job' => 'Developer'
		),
	),

	array(
		'image' => 'img/team/diogo.jpg',

		'pt' => array(
			'imageTitle' => 'Diogo Bentes - Programador',
			'imageAlt' => 'Diogo Bentes',
			'name' => 'Diogo Bentes',
			'job' => 'Programador'
		),
		'en' => array(
			'imageTitle' => 'Diogo Bentes - Developer',
			'imageAlt' => 'Diogo Bentes',
			'name' => 'Diogo Bentes',
			'job' => 'Developer'
		),
	),
	array(
		'image' => 'img/team/fred.jpg',

		'pt' => array(
			'imageTitle' => 'João Cunha - Programador',
			'imageAlt' => 'João Cunha',
			'name' => 'João Cunha',
			'job' => 'Programador'
		),
		'en' => array(
			'imageTitle' => 'João Cunha - Developer',
			'imageAlt' => 'João Cunha',
			'name' => 'João Cunha',
			'job' => 'Developer'
		),
	),
	array(
		'image' => 'img/team/jorge.jpg',

		'pt' => array(
			'imageTitle' => 'Jorge Rocha - Programador',
			'imageAlt' => 'Jorge Rocha',
			'name' => 'Jorge Rocha',
			'job' => 'Programador'
		),
		'en' => array(
			'imageTitle' => 'Jorge Rocha - Developer',
			'imageAlt' => 'Jorge Rocha',
			'name' => 'Jorge Rocha',
			'job' => 'Developer'
		),
	),
	array(
		'image' => 'img/team/fabio.jpg',

		'pt' => array(
			'imageTitle' => 'Fábio Moreira - Programador',
			'imageAlt' => 'Fábio Moreira',
			'name' => 'Fábio Moreira',
			'job' => 'Programador'
		),
		'en' => array(
			'imageTitle' => 'Fábio Moreira - Developer',
			'imageAlt' => 'Fábio Moreira',
			'name' => 'Fábio Moreira',
			'job' => 'Developer'
		),
	)
);

function teamTemplate($cnt, $image, $imageTitle, $imageAlt, $name, $job) {
	$class = 'col-xs-offset-1 col-xs-10 col-sm-offset-0 col-sm-6 col-md-4 col-lg-2 team-box-img';

	//se o valor da posição for divisivel por 5 executa o if statement abaixo
	// if ($cnt % 5 == 0) {
	// 	$class .= ' col-lg-offset-1 ';
	// }
	
	//atribui offset 1 ao elemento na posição 0 do loop
	if ($cnt == 0) {
		$class .= ' col-lg-offset-1 ';
	}
	
	//atribui offset 2 ao elemento na posição 5 do loop
	if ($cnt == 5) {
		$class .= ' col-lg-offset-2 ';
	}

	$output = sprintf('
		<div class="%s">
			<img src="" data-src="%s" title="%s" alt="%s" class="img-team img-responsive">
			<h3>%s</h3>
			<p class="text-muted">%s</p>
		</div>
		',
		$class,
		$image,
		$imageTitle,
		$imageAlt,
		$name,
		$job
	);

	return $output;
}

# 0 PT
# 1 EN

function teamLang($language) {
	global $teamData;

	switch ($language) {
		case 0:
			$lang = 'pt';
			break;

		case 1:
			$lang = 'en';
			break;
	}

	$output = '';
	$cnt = 0;

	foreach ($teamData as $item) {
		$image = $item['image'];

		$imageTitle = $item[$lang]['imageTitle'];
		$imageAlt = $item[$lang]['imageAlt'];
		$name = $item[$lang]['name'];
		$job = $item[$lang]['job'];

		$output .= teamTemplate($cnt, $image, $imageTitle, $imageAlt, $name, $job);

		$cnt++;
	}
	echo $output;
}

?>

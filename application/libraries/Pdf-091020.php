<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once dirname(__FILE__) . '/tcpdf/examples/lang/eng.php';
require_once dirname(__FILE__) . '/tcpdf/tcpdf.php';
require_once(dirname(__FILE__) . '/tcpdf/tcpdf_barcodes_2d.php');

class Pdf extends TCPDF
{
    function __construct()
    {
        parent::__construct();
    }
	
    public function create($content, $file_name, $qr)
    {
		ob_start();
        $pdf = new TCPDF('P', PDF_UNIT, 'F4', true, 'UTF-8', false);       
    	$pdf->SetTitle($file_name);
    	$pdf->SetAuthor('TNDE Kota Bogor');
    	$pdf->SetDisplayMode('fullpage', 'SinglePage', 'UseNone');

    	$pdf->setPrintHeader(false);
    	$pdf->setPrintFooter(true);

        //$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
        // $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
         $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);
        $pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
		
        // set certificate file
        // $certificate = 'file://'.realpath('application/libraries/tcpdf/examples/data/cert/tcpdf.crt');
        // $certificate = 'file://'.realpath('application/libraries/tcpdf/examples/data/cert/ttde/tnde.p12');
        // set additional information
        $info = array(
            'Name' => 'TNDE',
            'Location' => 'Kota Bogor',
            'Reason' => 'Pemerintah Kota Bogor',
            'ContactInfo' => 'https://tnde.kotabogor.go.id',
        );

        // set document signature
        // $pdf->setSignature($certificate, $certificate, 'tcpdfdemo', '', 2, $info);
		//$pdf->SetLeftMargin(16);
		//$pdf->SetRightMargin(15);
        $pdf->AddPage();
        // create content for barcode		

		$pdf->writeHTML($content);
		//$pdf->write2DBarcode($_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'], 'QRCODE,H', 188, 42, 13, 13, $style1, 'N');
    	
		
		
		$barcodeobj = new TCPDF2DBarcode($_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'], 'QRCODE,H');
		$dir = 'assets/qrcodes';
		$ext = 'png';
		$file_png = $dir . '/' . $qr . '.' . $ext;		
		file_put_contents($file_png, $barcodeobj->getBarcodePngData(3, 3, array(255, 255, 255)));
	
		$pdf->lastPage();  
	
    	ob_end_clean();
        $pdf->Output($_SERVER['DOCUMENT_ROOT'].'tnd/assets/surat/'.$file_name.'.pdf', 'F');
    	$pdf->Output($file_name.'.pdf', 'I');
    }
	
}
<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Ketidakhadiran
 * 
 * @property int $id
 * @property int $id_pegawai
 * @property Carbon $tanggal
 * 
 * @property Pegawai $pegawai
 *
 * @package App\Models
 */
class Ketidakhadiran extends Model
{
	protected $table = 'ketidakhadiran';
	public $timestamps = false;

	protected $casts = [
		'id_pegawai' => 'int',
		'tanggal' => 'datetime'
	];

	protected $fillable = [
		'id_pegawai',
		'tanggal'
	];

	public function pegawai()
	{
		return $this->belongsTo(Pegawai::class, 'id_pegawai');
	}
}

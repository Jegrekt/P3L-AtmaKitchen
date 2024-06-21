<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class PengeluaranLainLain
 *
 * @property int $id
 * @property string $nama
 * @property int $nominal
 * @property int $flag_delete
 * @property Carbon $tanggal_pengeluaran
 *
 * @package App\Models
 */
class PengeluaranLainLain extends Model
{
	protected $table = 'pengeluaran_lain_lain';
	public $timestamps = false;

	protected $casts = [
		'nominal' => 'int',
		'flag_delete' => 'int',
		'tanggal_pengeluaran' => 'datetime'
	];

	protected $fillable = [
		'nama',
		'nominal',
		'flag_delete',
		'tanggal_pengeluaran'
	];
}

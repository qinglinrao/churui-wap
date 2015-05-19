@extends('public.html')

@section('wrapper')
	<div id="main-wrapper">
		<div id="header" class="clearfix">
			<div class="left">
				<a class="go-back">返回</a>
			</div>
			<div class="center">
				<h1 id="page-title">会员等级</h1>
			</div>
		</div>
		<div id="main-content">
			<div class="user-level">
				<div class="level-info">
					<table>
						<tbody>
						<tr>
							<td class="first">Lv3</td>
							<td class="second">
								<div class="level-bar-bg">
									<div class="level-bar">
										6000
									</div>
								</div>
								<div class="left">3000</div>
								<div class="right">9000</div>
							</td>
							<td class="last">Lv4</td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="level-detail">
					<table>
						<tbody>
						<tr>
							<th class="first">级别</th>
							<th class="second">成长范围</th>
							<th class="last">有效期</th>
						</tr>
						<tr>
							<td>LV0</td>
							<td>无</td>
							<td>永久有效</td>
						</tr>
						<tr>
							<td>LV1</td>
							<td>0-1999</td>
							<td>永久有效</td>
						</tr>
						<tr>
							<td>LV2</td>
							<td>2000-2999</td>
							<td>会员有效期1年，1年后扣除1000成长值。根据剩余成长 值重新计算级别</td>
						</tr>
						<tr>
							<td>LV3</td>
							<td>3000-3999</td>
							<td>会员有效期1年，1年后扣除1000成长值。根据剩余成长 值重新计算级别</td>
						</tr>
						<tr>
							<td>LV4</td>
							<td>无</td>
							<td>会员有效期1年，1年后扣除1000成长值。根据剩余成长 值重新计算级别</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
@stop
Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id exOCILcrKGr1/QIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Tue, 09 Jun 2026 17:05:27 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 1953066181F
	for <lists+drbd-dev@lfdr.de>; Tue, 09 Jun 2026 17:05:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="L84i/HjQ";
	spf=pass (mail.lfdr.de: domain of drbd-dev-bounces@lists.linbit.com designates 159.69.154.96 as permitted sender) smtp.mailfrom=drbd-dev-bounces@lists.linbit.com;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 07B51163175;
	Tue,  9 Jun 2026 17:05:26 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 16300 seconds by postgrey-1.31 at mail19;
	Tue, 09 Jun 2026 17:05:16 CEST
Received: from SN4PR0501CU005.outbound.protection.outlook.com
	(mail-southcentralusazon11011005.outbound.protection.outlook.com
	[40.93.194.5])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 43D88162EF2
	for <drbd-dev@lists.linbit.com>; Tue,  9 Jun 2026 17:05:15 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
	b=lCQGvJscpAqhFxeKUTvgkgchzLMuQm60tJeNW5CQ0tc3S11lK0JcBTt09Q48AaUM0iNbjWGlWoLzGz7LFw/r4b4vPaUuJe23ucwq4lPZW+o56rHRDVtPLuneLMEhcy3zHhMkk6nyIg1Mg6vswiCll60wztN9MV/3d2aQRsEX4aDrJwySWbGL7i8T6F+OncbrVJxbN2FOFBC72jTHetYOtqOmFeVTwr2uESdcrZTfk4c+djc+x5ugrkkvPEW/A5jyqFImTIjwZODkLC0X1wbnEwFQAtMmiC5Aia0xY2q0JHiPpJD36x0rqHFdSqYDoi0iLgP5HCdGWgHcZT7p5X0x/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector10001;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=1exUrY7Qo3lVA7JgoG0qMXXtrxWa1FvVhQ6rQaMKzl8=;
	b=XQGGeqFNy1/0F1LsnVrBueC8BV9bJXf/QynNJQ5kirVHbI4f+g13Kl1KFVRu+hVUbxbWVg0O3j/ZDaPIsuQ94hmSHn+L6zCrMJ5DOASiwv4eHlNy+LeuPbjT4ZiiwTDIZDKffj7VJoiXTu5pblZITRj0PSwl+VdecM7mJzBquKOxCSFh/LpyEgQrhAbsegEOS7G5GEm6OfsDbR2KA/FMyhC2SVBcUgSnlAIhxwlMHXrEFC4Rodr7svH2K2fHDV/CtjBADU3yHmQs5idSYzbd0PK0IXphjsX4TqrrGR6aDOT3S9Y73Ps0Hw9lV6GG4imLI+cCXb18mPeFci/6CBpZHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com;
	dkim=pass header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1exUrY7Qo3lVA7JgoG0qMXXtrxWa1FvVhQ6rQaMKzl8=;
	b=L84i/HjQWvmxlqRgb7ackx5yJTz87lUy7VE6HcqY4qA8L7C81q/S27p53NsDoIGPFNa/vkBgoD7UXwpC/Tb/D1hMjxBW7HWeCjklPhfAAQzk+HqS6gg6HMzUQ//i0GVLGlsRJN8/rd2IppVHDQ4/JO9KQww3PjguQM3VRYctviA=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
	by SN7PR12MB7347.namprd12.prod.outlook.com (2603:10b6:806:29a::15)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12;
	Tue, 9 Jun 2026 10:33:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
	([fe80::ce69:cfae:774d:a65c]) by
	PH7PR12MB5685.namprd12.prod.outlook.com
	([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006;
	Tue, 9 Jun 2026 10:33:30 +0000
Message-ID: <bd0b7393-8ccb-4d67-8bfc-18c68347122c@amd.com>
Date: Tue, 9 Jun 2026 12:33:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/14] list: Prepare entry iterators to cache cursor
	state
To: Kaitao Cheng <kaitao.cheng@linux.dev>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Muchun Song <muchun.song@linux.dev>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, 
	Jens Axboe <axboe@kernel.dk>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
	<tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
	Eddie James <eajames@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Davidlohr Bueso <dave@stgolabs.net>, "Paul E . McKenney"
	<paulmck@kernel.org>, Josh Triplett <josh@joshtriplett.org>,
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260609061347.93688-1-kaitao.cheng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR04CA0179.namprd04.prod.outlook.com
	(2603:10b6:408:eb::34) To PH7PR12MB5685.namprd12.prod.outlook.com
	(2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7347:EE_
X-MS-Office365-Filtering-Correlation-Id: e4ddc47c-7238-44ef-a3f7-08dec6128c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
	ARA:13230040|1800799024|366016|7416014|376014|921020|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: fJIaLgXpgcNug3LCR18J+qaYh8wIinv9We7sUHZPPLMIiCfcJWiOqIjEbcJiOx4Si0KMO3U2nofKBWObiOF7oUWce3oXb8H2lz2LWt04fqV0L83eQJl+VWBMuZfnfqmY43cPmo5rHYKjEWBW5Qd8bN+X8PKnL+driRgyGOmBH2feqgId8qPITj0ZMHLm9GA5BVLigCquZrWDuLyuZUy4Tl0Zfw77QQ44As8N2avbf1Qv4Ce46wEg0A07BT17QOsnRSPjK+iuCrRu5kOVYd+g6nfNXf9mu2KorBx9GW1ZtQ+WhuIPY1o3ye7WrnuST7PGV/3c3Y9MqxKqdFNBF+xIq0bZN87vgVa3+C3eM8R2oeCVeEtsXXj+4LAukExvhwWSbXd6IMYM1pXHdz8MTco8f8iWvblkuwjQIHCYy7sCaKTm9nn/TIJws9lvH2zxEtDXo2tHs4UunLAk9kAM93nZXNdAFQf30TvcTht4+pP5UdKya808JBnSI05wMbV4CXTbJMsfruTKg6mMJl4y3ZV6+H4KhY+hp8IYpzXHuMwDPtdLGVbiqzb39PXt7Ng0z5VGzLSkUt9+7Yjg9HXUZ6G90XpZ72RkSqJgA7HA4xAFQnS1z/Ka1MwY77PbgbV9qrj6HxRYBPAgSJp702JRomVQVvDXGoQLFEC+4b2S41XaKMIQLjGgvfPX5zl5PMg8Gimg1BG4SSfnWYM7TOv6vm7XuZLxj/GaQLWtbm3wpEHu9L1WjCiGb+sab4ecGmoTV4Lq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(18002099003)(22082099003)(11063799006)(56012099006);
	DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTlRRXVMSitRcjUycDhudHowTG01Vkx3ZExmcWswL25DVnQwMFdtbDIweHNq?=
	=?utf-8?B?Mm82SFc4em1CNU1sc2xLQy9qYTgxWFdhS2lZRjEvbHR0NUVDMm9qaVY2UHBG?=
	=?utf-8?B?RU1CZEVjMkhNRnBLWWVPOHRHaG1qTjJLVk1GbzFUU1A5bVBDZlowaG9PcHVv?=
	=?utf-8?B?bEU5MEZ4WjE5L05MT3lzWU0ydUFDeWdpMXlnSHkxN3VVdThVUWIzMDQ3bXgz?=
	=?utf-8?B?VVcyNkl1UjV3U21pVGlTUEFwUHFjSTVhcUQyYThpWDhsUnFpMWVob3R6SldZ?=
	=?utf-8?B?citoTzFEOHF1UUlYZ0Vtc2lrRU9NdG1GT1d5NElSKzY2MU9mTm1IZ21tRGpw?=
	=?utf-8?B?ZFVNZXpMeHBodE5XL2FZVnE2VjZlbWxkZHVOd2UreStiRmtKeks2b014OVUr?=
	=?utf-8?B?dWJ1SUt0d2dVZ1dsaVJNS2tIS3E3TUFGbC9xWWhuZmZaWmY4MGNkT1FUMzF5?=
	=?utf-8?B?cFJ4ZC9RTjFpR2EyYXJKWGRKOHZVZk81MUxLM1pBa1FmSDVHSms4Vi9FWElu?=
	=?utf-8?B?Szdnc1d5RndWWDJLWjFYTVI2V0pmVk03L1RGWitTdm94N2xscERwTG1OZWlD?=
	=?utf-8?B?NExGc0htaVF6SUlNZzdzUDhTYWVDSG16MDgrangrUkVPUVpJRDRWcGVvMVlk?=
	=?utf-8?B?U29qY2tZVGgrQVdpRGk5cWpQTUU2cVJVVENTMlU2bnB6Ym1vR0M1RXM0ZnY2?=
	=?utf-8?B?QTVDeDhiYTR2N3F1YWRldXNsbUd1KzJoUnRFRDAwcWwvL1o5UkRnUElkZlli?=
	=?utf-8?B?TlVqUi9ueTRMSlM1bVRiS1NvbDMzYVU5K2tQcUpZcENNTk1aY1Z0NVZJRURH?=
	=?utf-8?B?c3N4R2dONnR6d3kyRkIvM1U2QVZPNWhzbXRrM3pEeHpac0grYktvcDY1RXFq?=
	=?utf-8?B?bG01V2JXYUFlVm81cXNmMTg1Q0ozL2lGVld2NDJseEtYN1dycGhDWjRqUDFz?=
	=?utf-8?B?U0l4MXV6VDRlYmxGRUppZy8wbzczSHIzeGgxdit5WEN1YVpCZlpQcVVYMy9U?=
	=?utf-8?B?R05YZnUvenV4dDBmVk9pRXVJR0VkMDdLa3dUMTkvWGd3V3NsdHpkTGN0TnN0?=
	=?utf-8?B?WHVGMW5GZ0F2algvaUpOMlpqTFZDdEZkblZQd1hMbnlGTHZVcDlqZEdmUUNF?=
	=?utf-8?B?Nm9TSzBKZDEya1Fzak1EYXJWam1uSnl5eEMwYkVUWEVYaUhjNGZCemtRZTh6?=
	=?utf-8?B?ZW9pZkxndEsyaVJQdFlvd04veEZ6UEhXb1paVlVKWXN2U3pIK0p2ck1qaXBO?=
	=?utf-8?B?dSt5NmV3dG9NQzMrMGtkZmh6d3VQUVRVQjQ3S1VCM29yZW54RG4zd0FHeTRT?=
	=?utf-8?B?ek83YkUwNjhqSjRsS1VqT2RtbW9WbTRJUHArTkRuZVd6UUI1ZjU4YUpKMzRu?=
	=?utf-8?B?emVSUkdkZVk2S0kzOWFOQlByeFJBdElBRVI0cm9uYStUeW1TRCs3Nm1NYUE2?=
	=?utf-8?B?UkhJVzNTQWNibTQwM25URUdGaVpCSXhhNVpvSndOU3ZPK25QbE5rU3Qrd09B?=
	=?utf-8?B?anE5YnFVOWs5cGcwRlVSS2RsSlFyeHBNc1RMQTdDSTd3OVRFNWlrOHhTL1hT?=
	=?utf-8?B?clNCZ09lbkJ0RE5qRGlEd1pvMTEyV29ic3RXcks4MGdXME5hTjZDWnJsdm1j?=
	=?utf-8?B?MjFQS3dKZ1NJL3ByTkVPVkNqOUF0VTNZeFJzVFN2c0NZU0tLMFlkcHNuRzdP?=
	=?utf-8?B?cVNoLy9HdGNBU04xdG1ySWV4NkF5cE1wTDM5Mi91d0JqaW5iaG52VUFPbEs5?=
	=?utf-8?B?K1lTaWZXemFjeXMwWmxTNSs2M242M25SWlZQQUN5RVdHamJyVyt2b0FtdFlj?=
	=?utf-8?B?SU44QUNJclVlWHBWZ2tDbFJsQ0VDekR0NkxGZUVvbjQxbmFrM0RhN1dyNUEz?=
	=?utf-8?B?S0Q2WjVTZksrdk1BRG50M1Y5VWRmYVlZOWhiQm11OUlNQVoyQmZjbFY0OGhT?=
	=?utf-8?B?aXRIQmthK3ZQbGxLeTFUeXdCejNSVmVnOGJmWHdwa0hkeVNDbFgrRi9Odkp5?=
	=?utf-8?B?bmg1QjhjeitDbkh1WVBCN01IckNtU1NmR2kyYm1HQ0FIeXlHUHVVeGJ0MGhS?=
	=?utf-8?B?bWRQOWxtam1oNm1oalNiU3ZmeFZNUkNmd0hlb1RTYXlnKzVXd29JdEJFc2NV?=
	=?utf-8?B?VFZjRnJKN1BkSzR2QzdxT0hBaTlOQUFFNzJnRXFrNEo4dnUzcUVOZE9MalJC?=
	=?utf-8?B?dHpUOW5TbjBydWpLbEFoNnY0dUFMcVdHbnRJYkw2alN3dGo3ZWdtQWswTVU4?=
	=?utf-8?B?SXppaUlWYlpwT3hLbGxoVERYU1RCZWVsSlBLNEtyRno5VW52dkZPeklGUTR3?=
	=?utf-8?Q?gYJlWein0Pm5ja/Aun?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ddc47c-7238-44ef-a3f7-08dec6128c8f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 10:33:30.4796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IlHMK/h8qOYTMLFlOp4FhET2Jf2km6ZN0BdmXe1dA3SfQn9bTkNiaxAb5v8XEnju
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7347
Cc: dri-devel@lists.freedesktop.org, David Howells <dhowells@redhat.com>,
	linux1394-devel@lists.sourceforge.net,
	linux-stm32@st-md-mailman.stormreply.com, drbd-dev@lists.linbit.com,
	Matthew Brost <matthew.brost@intel.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Kaito Cheng <chengkaitao@kylinos.cn>,
	Matthew Auld <matthew.auld@intel.com>, Waiman Long <longman@redhat.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jonas Karlman <jonas@kwiboo.se>, intel-gfx@lists.freedesktop.org,
	linux-sound@vger.kernel.org, linux-block@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Christian Brauner <brauner@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Andrew Morton <akpm@linux-foundation.org>
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.61 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,redhat.com,lists.sourceforge.net,st-md-mailman.stormreply.com,lists.linbit.com,intel.com,gmail.com,kylinos.cn,bootlin.com,kwiboo.se,vger.kernel.org,lists.infradead.org,kernel.org,infradead.org,ideasonboard.com,linux-foundation.org];
	FREEMAIL_TO(0.00)[linux.dev,linux.intel.com,linbit.com,kernel.dk,sakamocchi.jp,intel.com,linaro.org,kernel.org,suse.de,gmail.com,ffwll.ch,ursulin.net,amd.com,linux.ibm.com,foss.st.com,nvidia.com,stgolabs.net,joshtriplett.org,infradead.org,redhat.com,perex.cz,suse.com];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,drbd-dev-bounces@lists.linbit.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kaitao.cheng@linux.dev,m:andriy.shevchenko@linux.intel.com,m:muchun.song@linux.dev,m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:o-takashi@sakamocchi.jp,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:ray.huang@amd.com,m:eajames@linux.ibm.com,m:broonie@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ldewangan@nvidia.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:dave@stgolabs.net,m:paulmck@kernel.org,m:josh@joshtriplett.org,m:peterz@infradead.org,m:mingo@redhat.com,m:will@kernel.org,m:boqun@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:dri-devel@lists.freedeskt
 op.org,m:dhowells@redhat.com,m:linux1394-devel@lists.sourceforge.net,m:linux-stm32@st-md-mailman.stormreply.com,m:matthew.brost@intel.com,m:jernej.skrabec@gmail.com,m:chengkaitao@kylinos.cn,m:matthew.auld@intel.com,m:longman@redhat.com,m:luca.ceresoli@bootlin.com,m:jonas@kwiboo.se,m:intel-gfx@lists.freedesktop.org,m:linux-sound@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brauner@kernel.org,m:rdunlap@infradead.org,m:linux-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:Laurent.pinchart@ideasonboard.com,m:akpm@linux-foundation.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	RCPT_COUNT_GT_50(0.00)[62];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	TAGGED_RCPT(0.00)[drbd-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1953066181F

On 6/9/26 08:13, Kaitao Cheng wrote:
> From: Kaito Cheng <chengkaitao@kylinos.cn>
> 
> This series prepares for, and then updates, the list_for_each_entry()
> family so the common entry iterators cache their next or previous cursor
> before the loop body runs.

Why in the world would we want to do that?

The safe and non-safe variants have very distinct use cases and that is completely intentional.

What we could improve maybe is the documentation, from my experience an astonishing large amount of people have misconceptions about the safe variants.

> The first 13 patches open-code loops that intentionally depend on the
> old "derive the next entry from the current cursor at the end of the
> iteration" behaviour.  These loops append work to the list being walked,
> restart traversal after dropping a lock, skip an entry consumed by the
> current iteration, or otherwise adjust the cursor in the loop body.

Well I have to clearly reject the changes for subsystems/components I'm maintaining, that just looks horrible to me and I clearly don't see a good reason for that.

Regards,
Christian.

> 
> The final patch changes include/linux/list.h to keep a private cursor in
> the common entry iterators while preserving the public macro interface.
> The safe variants remain available when callers need the temporary
> cursor explicitly or have stronger mutation requirements.
> 
> Changes in v2 (Muchun Song, Andy Shevchenko):
>  - Drop the list_for_each_entry_mutable*() helpers from v1 and make the
>    cursor change directly in the existing list_for_each_entry*() helpers.
>  - Open-code special list walks that rely on updating the loop cursor in
>    the body, preserving their existing traversal semantics.
> 
> Link to v1:
> https://lore.kernel.org/all/20260529082149.76764-1-kaitao.cheng@linux.dev/
> 
> Kaitao Cheng (14):
>   drbd: Open-code transfer log list walk
>   firewire: core: Open-code topology list walk
>   drm/bridge: Open-code bridge chain list walks
>   drm/i915/gt: Open-code active timeline walk
>   drm/i915: Open-code DFS dependency list walk
>   drm/ttm: Open-code reservation list walk
>   spi: fsi: Open-code message transfer walk
>   spi: stm32-ospi: Open-code message transfer walk
>   spi: stm32-qspi: Open-code message transfer walk
>   spi: tegra210-quad: Open-code message transfer walk
>   locking/locktorture: Open-code ww mutex list walk
>   locking/ww_mutex: Open-code stress reorder list walk
>   ASoC: dapm: Open-code widget invalidation walk
>   list: Cache cursors in entry iterators
> 
>  drivers/block/drbd/drbd_debugfs.c      |  4 ++-
>  drivers/firewire/core-topology.c       |  4 ++-
>  drivers/gpu/drm/drm_bridge.c           |  7 ++--
>  drivers/gpu/drm/i915/gt/intel_reset.c  |  4 ++-
>  drivers/gpu/drm/i915/i915_scheduler.c  |  4 ++-
>  drivers/gpu/drm/ttm/ttm_execbuf_util.c |  4 ++-
>  drivers/spi/spi-fsi.c                  |  5 ++-
>  drivers/spi/spi-stm32-ospi.c           |  4 ++-
>  drivers/spi/spi-stm32-qspi.c           |  5 ++-
>  drivers/spi/spi-tegra210-quad.c        |  4 ++-
>  include/linux/list.h                   | 46 ++++++++++++++++++++------
>  kernel/locking/locktorture.c           |  4 ++-
>  kernel/locking/test-ww_mutex.c         |  4 ++-
>  sound/soc/soc-dapm.c                   |  4 ++-
>  14 files changed, 78 insertions(+), 25 deletions(-)
> 
> --
> 2.43.0
> 


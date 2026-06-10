Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9DDrBWQqKWprRwMAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 10 Jun 2026 11:12:04 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id A2335667AFD
	for <lists+drbd-dev@lfdr.de>; Wed, 10 Jun 2026 11:12:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=LS1aaYZP;
	spf=pass (mail.lfdr.de: domain of drbd-dev-bounces@lists.linbit.com designates 159.69.154.96 as permitted sender) smtp.mailfrom=drbd-dev-bounces@lists.linbit.com;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8E05D164573;
	Wed, 10 Jun 2026 11:12:01 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from CH5PR02CU005.outbound.protection.outlook.com
	(mail-northcentralusazon11012059.outbound.protection.outlook.com
	[40.107.200.59])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9DEF016086B
	for <drbd-dev@lists.linbit.com>; Wed, 10 Jun 2026 11:11:56 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
	b=XLsTWKvOrqNoL5y9vG4BglC5zhVKYY5h48A7r8DKwqouom2PAPCsR8dVUwPuWWjTIXQ+rR+Y39eZy0vH/eH4Qv/lcJVIdbg2Ys++yYssZyfzXKbfYsgSgqKuBwoDqLNldlBFeHSitP5j+5z2bFj6iAOgHdz/UhxDR3fAl0Q5o7l8o/kaHG/qu9RoGjMxQPvo3xB6UwQqHeHwS9GIZcehwHclZIpPwCBs8LxYBKCDZYKr5lehF0FXrU/0aRSenZN6Y1zQQoCCS9YcptXBfEisoZm3l4C/bP5p5B0a8kHvFh9fyk8D+Qant1URttIvpwEjVVLNeJAEjaWJ7KTHFqK04g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector10001;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=gQ+OE8QIAEvordwq9Eu9KduXF7SvGCeNdQFbFKcTS00=;
	b=wcRibGEguqE2bE7UWKzySrTCEBso+kwKN1+W1GZq2EQaQHT/j4u1xOExJhikVdZXlvo6HNeGpbuO+VE9XQ56EyTZBwKck5aNKYNFnaiWCsUqmwbFup4rrWMT33fHKmaT97Oi6nPEYWysY27QUJYeXxUyPPvR3bogoJG9jII/Re6DHAYDCbXsQrst5n8rScy3ntXy7cqe+lyuLjvd4H6mOn40l7kvQUPC/FazuymAe6yoT8b2xO78aULg5Iv533njULkobE67TE9dAlYKjCOU1l2EbwEfaG+2F6ZIvOv3gvo7+qBwE7nuR3Pw2XyfoZKfih2R9bWbSO+7yiUiFalCew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com;
	dkim=pass header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gQ+OE8QIAEvordwq9Eu9KduXF7SvGCeNdQFbFKcTS00=;
	b=LS1aaYZPLyJN1jVGavcWqfLUftprSIQw/07AGkLkBUG0UWQBe9QqfwZxWOEYj4VFh64DyrnQJYH0xIALiwgW/puLyrDEoorDHljrSDr0ymc3cYWk4FSAVMCX/9qWXrDdk8iCY/00P49M5AUe2MTWAOyBUY1Iq2GGPEktW5kxtFU=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
	by CY8PR12MB8241.namprd12.prod.outlook.com (2603:10b6:930:76::10)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11;
	Wed, 10 Jun 2026 09:11:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
	([fe80::ce69:cfae:774d:a65c]) by
	PH7PR12MB5685.namprd12.prod.outlook.com
	([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006;
	Wed, 10 Jun 2026 09:11:51 +0000
Message-ID: <d974a2ea-6102-45ff-bf36-3b25a2404e40@amd.com>
Date: Wed, 10 Jun 2026 11:11:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/14] list: Prepare entry iterators to cache cursor
	state
To: Kaitao Cheng <kaitao.cheng@linux.dev>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
	<bd0b7393-8ccb-4d67-8bfc-18c68347122c@amd.com>
	<5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
	<6b2efdee-95b0-4306-a682-0d0466497ddb@amd.com>
	<2399841f-d834-4652-8285-4a15c7d9a9b9@linux.dev>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2399841f-d834-4652-8285-4a15c7d9a9b9@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0086.DEUP281.PROD.OUTLOOK.COM
	(2603:10a6:d10:1f::13) To PH7PR12MB5685.namprd12.prod.outlook.com
	(2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 7464e8d5-7c24-4f24-2866-08dec6d04ee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
	ARA:13230040|23010399003|366016|1800799024|376014|7416014|56012099006|11063799006|5023799004|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 1htKofcJEs3WQFHVpqi/ZmKoxqDUWoziML8B50OQPmpkEjon74KxOB4u+OnvZqitJp3H3n59XEPQXs2ZM4rK2Cs9/Ou7Ts7zj8RPb+qk9qPCE/NwXunHVvwUQiyqyePQ65c9iaUNAAQo7eHgiLuOTtQw2H5ZJXeZXOxx6nr0fe3xuSuA5WIbHeU2MNT8I/ulSp23QMEgjoaSmAlKN2Ng1IXF04RdL/vJgQll0jWEgJUi/o9Me5pxFZxh32wZpQGuzskmyLR5HkeNbjki0A+VlpiqpS+SWNaQnrPd9nOy0zlCn1sNrbtVKSRps52Z8qwUjW3kX841RiI5iCa4+z2na3c9fsjOo0pEcazTH1A/2NtmDXYn+CCqV+mmlL4hUWfUfchpGcHERGgTqKWjLR0vSUWQhqxTuRKGlNNaL/r3Z/eU/6w7ctm28LMvqNedaFsls0VSmuNBDoBZZfPFXGxvihQkIMzL9LR9HZz+omUTgGaG3RH2QyuBsNEeHgs8ex5VN/lyz6QaxSmhBdgD7FvpJ/Kyygo0tUrSneiSOsh1wNaCMMOgsRrhlngP0fIeEF0fA6Xv3GIX3QMVLRUNFhBk83t8fHi22FaSFf8EQfRiIRdZhYZKDzGYqi8pfhxH19Z6LhOQ5adR6YyVHzYys3HMORl3YOwwW9+M45e9KZqFZkv7twfLSeTk6iq2XaSLgMOMEbslKgBFRuPYKVznmbYbtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(56012099006)(11063799006)(5023799004)(4143699003)(6133799003)(22082099003)(18002099003);
	DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTVwSGRWQ2NlUmhwb3dVN2M3RjV3SVlsSXRoa3Y2VVVyQWwxaWU0MmhsVTFI?=
	=?utf-8?B?czI5UTFiM29IOEhIOTUxVVpoQjRqbGVMSGV4dWRHNFJZOW9EVG5YczdsbkEw?=
	=?utf-8?B?cVExRk9CZG92emlEM0dLaGRLeDNvazZQclVoSVQ1S25XUWJYVExiVnJabHM5?=
	=?utf-8?B?OFFEdkZmaVFTUnE3enh1aWM0czVlRitQZ0U1c3dDQzdkWXdwUmswRGNzV2th?=
	=?utf-8?B?c0h3RXF5VzlISVk0dW84WGY1Q3ZWTUpKaXhRN0JqMDZzSWFNQ0F5cXpjd0Fm?=
	=?utf-8?B?cDJTb0d2cklGUXJ5UjcxMkVHUWlyRGxZTGlvNjJCZ0xxcVpST0h5bGdFRDY3?=
	=?utf-8?B?Q25mQnpZMDZlVi9LZktkWlkxZmNKNHpuK1F5NzExYjIzUEErNFFFYTBDekpS?=
	=?utf-8?B?aVltbGJyemoyTS8wOVB3dElwUVIwamhJWDR5VUtQeFdoMUtNYXFvVU4ra0Nt?=
	=?utf-8?B?cHJieDJUT3F3NUduSnlyb0dpdFFLTHRaYktmTmlZZ0xEZC9jc21ZU2VEaFNM?=
	=?utf-8?B?ZXBPbHd4TVB0TjA4NVVxVU1hN3Bpem1XUWREQXBoL0tQc1hUVmpOTW9oVTgx?=
	=?utf-8?B?RnIycUtLMTVuRExEYTRFYVZsbVRmRXBzYTRDUFJGMTNnblJYNU9xSDJ0TlhL?=
	=?utf-8?B?YndaVStabGwyRGVzeEZsWG4vUTBDekJ3VjMwdkd2ejV3aUladjlFK0srWXNS?=
	=?utf-8?B?YmVNZmxPd01lVGFLNDhpbFdCZ245bVgyUXJVYnIyR1I5a01lN3dPSmhYbjgr?=
	=?utf-8?B?RUFwNW5XQWNuWnJrYUtKMFEzMFdkZWswdXlIanAwZG5YUzRZWUFiVnMwZDJC?=
	=?utf-8?B?K0dJeGtVdjc0TkhGc0NEU0t3OTVqbWI1azB2eUZZT2prMXM1ZzhqUHR5S0tE?=
	=?utf-8?B?QW5IMWcrUG9weGE4SUJwR0UzMWJocHZreEpwaGJjdThLUExWT0pEYmtpRitl?=
	=?utf-8?B?VXNtQUROUWx2YTVlNFVnRStjVEdsbEtlQTB4Z2FyT2NHcUlWUVE0b2hBTU5O?=
	=?utf-8?B?QWFBZ2EwNDMzRzRGZjF6NEltSU5NcTFyRmFieUF5ZW0rZWRmaHF1U3htNGFT?=
	=?utf-8?B?Qm44cDY0cWFLTVhpK3d2MXlQNzNTNW5EK2liUU02cE93YlpzTVFocDJUei85?=
	=?utf-8?B?Qk1YVnpEVkxyalpoNU1mQnZ5aCtrZFFaUHlQZDRQRVNwMXZpRXVYOUhNMzJK?=
	=?utf-8?B?Qno3MnhwWjFWYXRYNTQ0dUwyMmJCQk10dU5yenQrRXJxRHprcWRaMzZtc3Fs?=
	=?utf-8?B?NStjVlRUNndrS1lrZnNzOEUyckxGUEJTcG9jR2FYVy82UThsYW9MU3V1MXIx?=
	=?utf-8?B?RTdlNHRSMUlyZTBzZXVFSlp0SGF3TmFDWDM4L3J3Ukk4OURQZ1pPOWphNngx?=
	=?utf-8?B?LzVjN0FvWXByTU82WlhYN3B1Ynl6S2NmTUovNGhQMlBEbEo3RVJacFVIUXhE?=
	=?utf-8?B?MGYyV0lCQTBZd2J1VHYwYmJ4V2hiVlpkWGZXVlQrUVZlZEtRa1J6U0h0d00y?=
	=?utf-8?B?V0tLbXhOcTRpNVFXdnZ0QlZ0ZFlRdzVodmNERlJ4Sm5mdkdOclNJTXdRVWR6?=
	=?utf-8?B?eStsdStTQTI2dS9nSCthUVNLYXpacjJXdHQ0UnRuZU1ZZzJXeG9hT3NXeDBM?=
	=?utf-8?B?RjI5dTRXUnN5QkdYQTJ1Q1RQNHNvSUFLWWpSaWppOTBrQjQ3WGgxMnBWSC9G?=
	=?utf-8?B?L0NwOURhSDNGbXVzUHhBb0F4dkZ2SjI1VzdLWXM0Rnd0U3lVdFBmWGpIVHYw?=
	=?utf-8?B?YTZNUjJEUE4xUGdhU2hZYTY0NWtrajNmOEdYL2Zya0dmQWVOL0pRanJyVHpO?=
	=?utf-8?B?N1pUWjFaNWRsU3RxOUh5Tis5K0pTa3NUY2g0TEJndmQyNUttTUt1R3ZzTmFK?=
	=?utf-8?B?NlJjaWM4bTNnTGlUc3pLRk41VkJMcEY1UjdtMHdYZmpuQTZlZURxYU82akVQ?=
	=?utf-8?B?ZXFSQ1ozZmd1MGJFQVJxOEJaeXJLSHVNUGV0T2xuaFJZOG4wWXB2bVkzdC94?=
	=?utf-8?B?dFZvbHlTYjhIdXBPc3UxWFVua1BSSzZWTGg0WnIrQUo5U3NCN3hoYkdJSWU1?=
	=?utf-8?B?MUtOVzNraUR4M0dXTTlUeGl5ZXZuRjhLV0IySi9PUldIc29GR1NvMU51N3lW?=
	=?utf-8?B?bkJWUDliK1JQLzZxOUNGb3NOaFdPeGJxL0kzMmFacEpFMkV3SUZ4OHM2cml1?=
	=?utf-8?B?SkpsNXVBSm04NStnNDRCNmdOZ3V0WmVBTlBxTnZ0RnRRRy9RMW96MThiaERL?=
	=?utf-8?B?cytjMnY5ZUZ4QncxMmJiZ2lXaFRUUEd2R2NDaEQvK29tUm00MVIwWTAyTlp6?=
	=?utf-8?Q?r++g69Ih9P6IalPmUj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7464e8d5-7c24-4f24-2866-08dec6d04ee4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 09:11:51.3845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2pS5uzv20sPGWEIj7DuFxfVi8xT8GgRzfTSwjQsp7tXU+0BXMaezMEMi/BXG3es
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8241
Cc: Muchun Song <muchun.song@linux.dev>, Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun@kernel.org>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Eddie James <eajames@linux.ibm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>, Will Deacon <will@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	drbd-dev@lists.linbit.com, Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kaito Cheng <chengkaitao@kylinos.cn>, Ingo Molnar <mingo@redhat.com>,
	Matthew Auld <matthew.auld@intel.com>, Waiman Long <longman@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>, intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	linux-block@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
	linux-tegra@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	linux1394-devel@lists.sourceforge.net,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Christian Brauner <brauner@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	linux-spi@vger.kernel.org, Huang Rui <ray.huang@amd.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
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
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.dev,infradead.org,kernel.org,linux.intel.com,linux.ibm.com,foss.st.com,lists.freedesktop.org,vger.kernel.org,redhat.com,nvidia.com,intel.com,ursulin.net,st-md-mailman.stormreply.com,lists.linbit.com,ffwll.ch,stgolabs.net,gmail.com,suse.com,kylinos.cn,linbit.com,bootlin.com,suse.de,kwiboo.se,joshtriplett.org,perex.cz,lists.sourceforge.net,lists.infradead.org,kernel.dk,linaro.org,amd.com,ideasonboard.com,linux-foundation.org,sakamocchi.jp];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kaitao.cheng@linux.dev,m:andriy.shevchenko@linux.intel.com,m:muchun.song@linux.dev,m:peterz@infradead.org,m:boqun@kernel.org,m:joonas.lahtinen@linux.intel.com,m:eajames@linux.ibm.com,m:alexandre.torgue@foss.st.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:ldewangan@nvidia.com,m:andrzej.hajda@intel.com,m:tursulin@ursulin.net,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:simona@ffwll.ch,m:thierry.reding@kernel.org,m:dave@stgolabs.net,m:rfoss@kernel.org,m:airlied@gmail.com,m:tiwai@suse.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:chengkaitao@kylinos.cn,m:mingo@redhat.com,m:matthew.auld@intel.com,m:longman@redhat.com,m:philipp.reisner@linbit.com,m:luca.ceresoli@bootlin.com,m:matthew.brost@intel.com,m:tzimmermann@suse.de,m:paulmck@kernel.org,m:jonas@kwiboo.se,m:intel-gfx@lists.freedesktop.org,m:maarten.lankhorst@linux.intel.com,m:josh@joshtriplett.org,m:jani.nikula@linux.intel.com,m:linux
 -block@vger.kernel.org,m:broonie@kernel.org,m:mripard@kernel.org,m:rodrigo.vivi@intel.com,m:linux-tegra@vger.kernel.org,m:perex@perex.cz,m:linux1394-devel@lists.sourceforge.net,m:lars.ellenberg@linbit.com,m:linux-arm-kernel@lists.infradead.org,m:axboe@kernel.dk,m:neil.armstrong@linaro.org,m:brauner@kernel.org,m:rdunlap@infradead.org,m:linux-sound@vger.kernel.org,m:lgirdwood@gmail.com,m:linux-spi@vger.kernel.org,m:ray.huang@amd.com,m:skomatineni@nvidia.com,m:Laurent.pinchart@ideasonboard.com,m:mcoquelin.stm32@gmail.com,m:akpm@linux-foundation.org,m:o-takashi@sakamocchi.jp,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[61];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,amd.com:from_mime,kylinos.cn:email,lists.linbit.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2335667AFD



On 6/10/26 10:18, Kaitao Cheng wrote:
> 
> 
> 在 2026/6/10 16:07, Christian König 写道:
>> On 6/10/26 08:14, Kaitao Cheng wrote:
>>> 在 2026/6/9 18:33, Christian König 写道:
>>>> On 6/9/26 08:13, Kaitao Cheng wrote:
>>>>> From: Kaito Cheng <chengkaitao@kylinos.cn>
>>>>>
>>>>> This series prepares for, and then updates, the list_for_each_entry()
>>>>> family so the common entry iterators cache their next or previous cursor
>>>>> before the loop body runs.
>>>>
>>>> Why in the world would we want to do that?
>>>>
>>>> The safe and non-safe variants have very distinct use cases and that is completely intentional.
>>>>
>>>> What we could improve maybe is the documentation, from my experience an astonishing large amount of people have misconceptions about the safe variants.
>>>>
>>>>> The first 13 patches open-code loops that intentionally depend on the
>>>>> old "derive the next entry from the current cursor at the end of the
>>>>> iteration" behaviour.  These loops append work to the list being walked,
>>>>> restart traversal after dropping a lock, skip an entry consumed by the
>>>>> current iteration, or otherwise adjust the cursor in the loop body.
>>>>
>>>> Well I have to clearly reject the changes for subsystems/components I'm maintaining, that just looks horrible to me and I clearly don't see a good reason for that.
>>>
>>> Hi Christian and Andy Shevchenko,
>>>
>>> Thanks for taking a look. I would like to clarify the point you raised.
>>>
>>> The reason I started looking at this is the original motivation behind
>>> the _safe() variants.  They exist because some users need to remove, move
>>> or otherwise consume the current entry while walking the list.  In that
>>> case the next cursor has to be preserved before the loop body can modify
>>> the current entry.
>>>
>>> The unfortunate part is that this could not be expressed with the
>>> existing list_for_each_entry() interface without changing its calling
>>> convention.  The _safe() variants had to grow an extra argument for the
>>> temporary cursor, and that is why we ended up with a separate family of
>>> macros.
>>>
>>> But conceptually, the distinction does not have to be exposed as two
>>> different iterator families forever.  The difference is an implementation
>>> detail: whether the iterator keeps the next/previous cursor before the
>>> body runs.  This series makes the common list_for_each_entry() iterators
>>> do that internally, so the safe and non-safe forms can effectively be
>>> folded together, or at least the need for a separate public _safe()
>>> interface becomes much weaker.
>>>
>>> There is also a usability issue with the current _safe() interface.  The
>>> caller is forced to define a temporary cursor outside the macro and pass
>>> it in, even though almost all users never use that cursor directly.  It is
>>> just boilerplate required by the macro implementation.  I find that
>>> redundant and awkward: the temporary cursor is an internal detail of the
>>> iteration, but every caller has to spell it out.
>>>
>>> With the updated list_for_each_entry() implementation, that extra cursor
>>> can be kept inside the iterator itself.  Callers that only want to walk
>>> the list, including callers that delete or consume the current entry, no
>>> longer need to carry an otherwise-unused temporary variable just to make
>>> the macro work.
>>
>> Well the distinction between list_for_each_entry() and list_for_each_entry_safe() is *not* there because you need an extra variable to hold the next pointer, but because just 'iterating the list' and 'iterating the list while you modify it' are two distinct use cases.
>>
>> Apart from the technical implications this also has some documentation value for the code using it.
>>
>> What we could consider with C99 at hand is to have _safe() variants who uses a local hidden variable to hold the next element.
>>
>> Or maybe come up with a better name instead of _safe() because people seem to misunderstand that quite often.
>>
>> But mangling the two use cases together just because it is now technical possible is among the worst ideas I've ever heard.
>>
> 
> Should we revert to v1, or keep list_for_each_entry() and
> list_for_each_entry_safe() as they are, close this thread, and make no
> changes?
> 
> Link to v1:
> https://lore.kernel.org/all/20260529082149.76764-1-kaitao.cheng@linux.dev/
> 
> Or do you have any better suggestions?

v1 looks perfectly reasonable to me.

You should just include some patches in the same patch set to actually use the new macros.

If you modify the files under drivers/dma-buf or drivers/gpu/drm/amd to use the new macro I'm happy to review that.

Regards,
Christian.

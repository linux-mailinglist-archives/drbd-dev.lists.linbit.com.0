Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C0838712393
	for <lists+drbd-dev@lfdr.de>; Fri, 26 May 2023 11:28:20 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 26D704252EB;
	Fri, 26 May 2023 11:28:20 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 388 seconds by postgrey-1.31 at mail19;
	Fri, 26 May 2023 11:28:05 CEST
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 146B9420151
	for <drbd-dev@lists.linbit.com>; Fri, 26 May 2023 11:28:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1685093285; x=1716629285;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=BgjT95wArCJb4q3cFAf3biUpSAAErt6sf3GM2j4oVmc=;
	b=i1UE9FuR0zucJpkHTzJX/x+rIYoN6DEC7DLwrWn//T1gfJwASOzwbSd4
	LyFHeoGCTaM1DXnW2KhHlwMmnjqG0ZwVXJ97f4rlyC1txSQqE9qJ2UfhC
	O9hSoZcGCyfjoN5gNAOtVY/BCvd1StuoCgHdvGlDbYXmo8OyOoWFjqKzO
	aAvbbOKqVLVAa0kqjvf0BCKkzTjFKZSZLg/zvXjInuAh+GjQ227mHaSGV
	8ld4YroAZJKgd5wirEJ/ESmmEQw0/hj14Pbfhlqptlt5Hopjge8AFnEGv
	vs2UdTb/1cjk0lOSIc7ZoNA4/aBjr2lv+E94Q792b69j0i8oXNANm3Jpa A==;
X-IronPort-AV: E=Sophos;i="6.00,193,1681142400"; d="scan'208";a="236654341"
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
	NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
	by ob1.hgst.iphmx.com with ESMTP; 26 May 2023 17:26:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=FttOCtpc9i+WvVU0rc5WRzvCzfOPYl/P9x80pDj55e0yJChU9QfBNH1I3uEZ2ImUW7OZTwU1cnMUQ0l94VnXia3kRQvNhp1TRC2Ow6gjHj3JY1Es5wo7SfQGrhBVzrOT5WATkKjsfC96m1VpVkWHkc9yUuqs9LpVsWIvY6sHYstTELeg0UjggK7jLRs7G/bin60sZdacMnaRnExXn41GBuwROCYtiIEOraadu+g14m/75iPNjSBUG3TMjkdT6FaxgZ5fyvvHBP/PyivDfCMeK/x39vyltGbd+wPNmVlv+wGfuDJuDahN0nKQ+E56kz+eoOQb7busA6SsfT+Wel7S1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=BgjT95wArCJb4q3cFAf3biUpSAAErt6sf3GM2j4oVmc=;
	b=TTEVtMqHYF2G3QUm1ehE795AZgCkUrpUYmPu7DUAM99PAYUu6/cB1JXrfmST9tOQPR9FELb8t3LghtquOF3J0bbcWZh2PzGNHqsVc2oeqry7U6OdYB+XrPJOv65vsCcA9bCz5EGJHn2vZkGm2HTWnNjXamx39n6gt2PM5lQpYsuQ1XHvfUgvPljIsMmVcKUx517ck41Pwh/X0PuweQg5HsIy2ovsAlixheQHrh1avAJQCf/dxrY39D3iT4ylhpBs/usbu1vwbNykd2cdzGh2+v1hAWtZo2bqTe1z1YPNNQI1dIYHU+9ZWTr3TRf2hkTGZVr3Z7Prp6I+gS/USyyIrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=BgjT95wArCJb4q3cFAf3biUpSAAErt6sf3GM2j4oVmc=;
	b=swJGVucBheJx8vyyAUEQMBLarbE3tVQ+e0iutf4I+Ra/OUTcs4afK1Z/H64TVyCuKMeX4dbr/GSPdeE2U0/UbOgFCp57mMS+lfqUjhHv01XpIoDLjj4bdbLjBhlmZS2pjt2TO6Z09fiaDAE58QpoeClWD1mAJk7kqMpN1p2rpwM=
Received: from PH0PR04MB7416.namprd04.prod.outlook.com (2603:10b6:510:12::17)
	by PH8PR04MB8712.namprd04.prod.outlook.com (2603:10b6:510:254::9)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17;
	Fri, 26 May 2023 09:26:48 +0000
Received: from PH0PR04MB7416.namprd04.prod.outlook.com
	([fe80::8c4d:6283:7b41:ed6f]) by
	PH0PR04MB7416.namprd04.prod.outlook.com
	([fe80::8c4d:6283:7b41:ed6f%7]) with mapi id 15.20.6433.018;
	Fri, 26 May 2023 09:26:48 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Luis Chamberlain <mcgrof@kernel.org>, "axboe@kernel.dk" <axboe@kernel.dk>, 
	"agk@redhat.com" <agk@redhat.com>,
	"snitzer@kernel.org" <snitzer@kernel.org>, 
	"philipp.reisner@linbit.com" <philipp.reisner@linbit.com>,
	"lars.ellenberg@linbit.com" <lars.ellenberg@linbit.com>,
	"christoph.boehmwalder@linbit.com" <christoph.boehmwalder@linbit.com>, 
	"hch@infradead.org" <hch@infradead.org>, "djwong@kernel.org"
	<djwong@kernel.org>, "minchan@kernel.org" <minchan@kernel.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>
Thread-Topic: [PATCH v2 0/5] block: simplify with PAGE_SECTORS_SHIFT
Thread-Index: AQHZj6RuVVwHwlQy5kaD+rEALgEnnK9sSRmA
Date: Fri, 26 May 2023 09:26:48 +0000
Message-ID: <c156b1e4-8a8e-e296-05f4-0ffd75903380@wdc.com>
References: <20230526073336.344543-1-mcgrof@kernel.org>
In-Reply-To: <20230526073336.344543-1-mcgrof@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
	Gecko/20100101 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
	header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR04MB7416:EE_|PH8PR04MB8712:EE_
x-ms-office365-filtering-correlation-id: e884dd21-3daf-4af9-0e59-08db5dcb5486
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tZG/rljJZKJFL4Hl8M5JBUSBw6yBwZCjBjTONTYQKMgVKaNDBGhbukQfuElhinAzbEaNP+pSPVfZAVlQMdIrXp7V1ffWNHg96ivFob/Th1mrJ3y1PGenHqzC30t+dHlnOu2CFepDDdgzd0pS0EoimREzw8sw8lu5kfGSHl4D+TBedEfVNspT3GOQemwIvmIrOHxHSQxPR6H5jdnFLpgvXRtLV0CcV5cYQmuEgKMfr2PU5WJmS/dxRRevSs0HDQIxJ7Lzr7tcRUqUah9JOMpe1Ibd61IDFGDsz/yZkE6jg6ls1mDwWhZFxAidPH5GqzKWykqodfhnpeUzMKAFQ7GqGdod7o50CudlsV4TnZ/lK7+QniRd/24v1hqfNrjULt2RtqXgEXIJoPZkNzMtuOLI3f1qub9x06L5aoJNtrUsU/lUiWLu0lDsn5sgGPyQJmcJNkjKk3F/i7wffUKEd7KGM0ri/4pgDo3fxm2wkJ3ZvS/FiLfLuuEbm15klk0/1jxfFCdQxiiN9kGmQwFKhV5fuPmyCJy6Xlx7QDg4ARgsDvw4vuxTXkm33cLl18MygDJEAI6r3nS2vnmIOAscdhSRZ0eLPlMuVIFDcOTWNvwL/HBOeMdOxX4DNM7o9lrHguho2NiM6FfP/0qXpERH3N+MydqBC+saeNsK5RPKG7O+hWwoWOm6ZMW02dCw679bcBcYSHGZ6BFgM6ws63g0v9kvylO90N/bs1Ua9Aq3WjBtuWSgovOV9UVHu1KH61YBvskv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:PH0PR04MB7416.namprd04.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230028)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199021)(64756008)(4326008)(66446008)(41300700001)(8936002)(91956017)(31686004)(66476007)(66556008)(76116006)(66946007)(8676002)(110136005)(54906003)(36756003)(31696002)(71200400001)(86362001)(6486002)(478600001)(316002)(5660300002)(7416002)(2906002)(921005)(186003)(38070700005)(53546011)(122000001)(38100700002)(83380400001)(2616005)(82960400001)(6506007)(26005)(6512007)(43740500002)(45980500001);
	DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGFmZlJSWXpYMC9ZRE5VSWRlSnhaUlVoOSt1cHdvN0hFTlptZ1BBWWVRZlFL?=
	=?utf-8?B?aVBPREtBOXRBUnh1WVRJRG93QUt0bU56Q3UvNWJnOE5ZeDI2RmJyNHc4WGc3?=
	=?utf-8?B?S1NJTGdrMTlCakc4eVdYdUlyNU95TS94NWsxQmRRR29TQnZ4VDA5UWI1ZGpz?=
	=?utf-8?B?WXpxbWxrbEh5UzB0L1c2NkUxSWpzQ25neFVmQWdmeHlXejdYK0xOWlV0ZEhU?=
	=?utf-8?B?YUt4RTJUTTQxaUFYcmw2bGY5QTVFU0hCeFo1SG80NXNLSXNZVzhUU3cvbVlo?=
	=?utf-8?B?R0JBWTViVzVCQUxGeGd1aWdBSmVPWDdxRU5nYnY5UC9hdFgwY0JUOTBxZHZk?=
	=?utf-8?B?Z1hESFFwK245TW5vaFppbk5hU2lpeW1mNTRhQmRVdUJ6QzlZL0FPWGRlbDZZ?=
	=?utf-8?B?bGpJcCtMUGJLYUZYRWV4cUpHOUdPZTNraHJ3QVVZeTVpUHZwQVhiTjN2ZzBW?=
	=?utf-8?B?RTIweDhiQ2wzWExoL0QzUlZmVmE2b2F5dGxnSWhmdnJtK2dxS0tnQVZsMDVJ?=
	=?utf-8?B?c0F3ZnRzV3QrbmhBa3dUdksvMlhEeVdTWnpMbElOMHJuQlNmRUQ3TU1hZXRH?=
	=?utf-8?B?b2xudkxkL2piak4wcFU3WWRVTVhMcUlnaG9iQ2pBWlRYQXEra2p2aXN0RnZC?=
	=?utf-8?B?YTd3eWQ0dHdsVmx5R21yV2NrQU1Hb1RhWitRalB1THIvSitrQSt4S1BHQmpF?=
	=?utf-8?B?MVFnMWxwRkNoOUtwdVFxb0wzVFdGWThwRks5VG4rUCtkWkF5REk5cllRUHdE?=
	=?utf-8?B?Z1BVaVBDWGRkSDN1cUZHZTgvM1ozbHhQZ0RxTGNadi85THFEZTYvOWU1RDF4?=
	=?utf-8?B?bEpNTy9qMTBEamplSVY4a1NIdEduZFljeFV3akxHaXhVcXpnQ09Wa1dNV043?=
	=?utf-8?B?b0lmWDd6NWdEcVd1QzhzYkJOMWJVK1EzK01HU2xvbWk4ZGZCK3BFQTZWdjRI?=
	=?utf-8?B?Q0pmcmExcG5ON1JSL1FLQzVHanpNVFBrcVc1QS92VkpRenV2N0laRmlJTHN4?=
	=?utf-8?B?d21Ja1NDWUxZMVBlNHRGWmxFOWduR2lIR0Y0TFMxVTE2UVd1ZEpZRmN4UERR?=
	=?utf-8?B?UW5ocFpuTHlOdnMwQ1lMTzVjRnVEVGVLMXBmOWRScTZta21OOXhZNUoyOFht?=
	=?utf-8?B?VHdVZk1OM0k0MGtkYXZFcVFGUCt3S1llNHJyVGE3NDlneVdxM1kwdjZwUkFt?=
	=?utf-8?B?WHRGeEhlZHNsbWlEeEluMGk4eHpPT1d4dDdzRGZaZHNKbWgxVE1uQ1l4bU50?=
	=?utf-8?B?WlVEK3VmaTdrZnVzTHdhdFhnSFhRdlZtRURaR2JsZ2ZKcW1QUjVEVWRmTEVu?=
	=?utf-8?B?RXo1NXZ6Nng4NG5ITisvVGNFTTR6WDJJeXRuTmx1Q0lOenhZZU43eVFXanp2?=
	=?utf-8?B?WHNaOUQ1Mjh6Nm5GWVZMd3UyU1JqdGxHaldNWkV5dUFmT3IyMU5WZDE5SjJi?=
	=?utf-8?B?Vzgxc25uQ3BJR1ZETjcyRDMyS2ZianVQczZOQWI3U1RVdy90NVZQTzN5djFD?=
	=?utf-8?B?N2pMN1VTeVZidGI1WFJ3QzhtRkhzL2xWanFydDNwNGdIV2YwdzcrdnBXNG5n?=
	=?utf-8?B?YXhKVmg2QTMvNDRGc3ZIS2Z2aDE5bEFNNXYwREhReDhRcUVhUEZDSmdQU2l1?=
	=?utf-8?B?a1VFbWVsbUNMQ0lvckJxaElyVThDTUhhOEVYMlRpeVZnTFdHZVg5ZTRndUg4?=
	=?utf-8?B?MDhyTVlzamdZeEdqU05zcjdDZ0N6RlRLYXh3aHZyeWQvSDMyanFhVzQzVndO?=
	=?utf-8?B?RCtjLzY0VWFUM3RiSTVFYWk4L2ROZFQ2czVyVHAwTk40RkhJQmc2TTJaSElp?=
	=?utf-8?B?WmFmc2lTOVVibFV1Wk9KaVFMMVZEcDBSN0hKU2RpRHYwcFlqRkJvZFhHa3JR?=
	=?utf-8?B?MERIaUZ6RVlZSWdQM0lCYWFreXRmRTFrZ2RESGZqS25VVEphWEVOL3VrWGRn?=
	=?utf-8?B?TkZuWDl6aTBZc3BITjRKdVViWjFuU1NYdlcrcFBUSSt6VzY5cFFrN1dqM2hW?=
	=?utf-8?B?M0RsYlFSL1NRTFdxRzB3Z3NUbzBwZkU0dEpYbnpIdE9nKzgyNFlIaHBSVW9m?=
	=?utf-8?B?L0taVmY4cFZpMnJnQUN1R3c1T0R3TTY0M3ZOT1A3TGEwYUNybzdka2pBelJX?=
	=?utf-8?B?UlIyYjgzVVNHR0xzbk5Vc1RFb0tGTVJ2NFZCdzRJZkJGQm12YXpuVENlS1la?=
	=?utf-8?Q?VPC6700jO+W80TTc3Xj2EEE=3D?=
Content-ID: <811ABC632CFA204FA57A834FE3BCAB71@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?aVFaZVcrMVlFZzQvMzFPVE5tY05vZTBGN2ZYU1IzMkNLTVhlZStNQ0phT09v?=
	=?utf-8?B?dGVDb0c2Q1FZM1dHVE9YcDIvc1NwTkMvejBqd3Fybk54QkNmd05RaUNURXJW?=
	=?utf-8?B?bHlxeENzLzJsTTBaeXNsYytUTlpoNjdreHYwWUlXRGlDVkE4Q25OZ21WaW8v?=
	=?utf-8?B?Njk4djVPdUlQVHJqRDZUS1dwUVZTT2kzSS9reWh3SjNaSUpiZU0zQUJBcHVp?=
	=?utf-8?B?SGpnelVvRkVjeG5GRU1pbTZlMFdGSGthMDQveXBJbVJqWWV0b1FvOEw3R2JF?=
	=?utf-8?B?WjJFQ0lxSERGSGlhVEYrUkxjSEw4NUFNZHZ5K2I0MEZtVGJTSWVuUTFQSWxM?=
	=?utf-8?B?QkNWWjlHZGQ5dG44WXUyQ283WkZJS3pSSDFRdzhjcVBhbEh6VmI5VDJxN21i?=
	=?utf-8?B?R0FkbzhWK2tqRUxEZ0hrRS9yRHdGR2hJd1hZd0ZBRlFFZzhwTG5ic3g5d2g1?=
	=?utf-8?B?SzNyZW51YVNEOUxQV1JSdU5pU0lnelZNamo3eDQ1RXlYZSsycjB2Q3lqYThw?=
	=?utf-8?B?YmY2RUxzZUJKK0ZzNG1vaFhTNUhtU1hPQmQrUjJoSEx6bFg4amNiRjFBSUcw?=
	=?utf-8?B?VjJxaDRtdzNmcUR1UEZaL1VUaXBOYVVMRlRGN2ZqZXlhRW4vSUtMSXMvejFs?=
	=?utf-8?B?byt3WVF2QXVFQ1FENktPdE5VUGxjYkxQaHlXRkNFelZvbmpLTzBzV1lubFRm?=
	=?utf-8?B?bUpyS3lOc3pKRGtVUVRITUNDb29EZHdETngrT0xtaUw5ZGtjbm9CL2xhcnRn?=
	=?utf-8?B?cXV6bEtwS3VlM3ZhM2thRFlueHg3RnJ6YWxTK2ttZG8xT3pSL3pXMENETThh?=
	=?utf-8?B?RU1ickwwUWIyOUdYdVZRUnJQa3JsUkJwU3pGSWJiT2dQTDUwTFBaWXpaQXFh?=
	=?utf-8?B?WTJnRXVKZDFpZlpTR1ZDdkNlWVZoRENOMHRPV3Fkc1NnV1k5cERtT2RnTkxY?=
	=?utf-8?B?RzZXOEc4L1Z6VTBHSmt2Ni9ydWxpdG4wVnFmcmJ5dVdGVVZKbkVKUk15eU40?=
	=?utf-8?B?cWVpbGoxNHdCbS9NTktET3oxV1JwK2tnZmkxSHloM2ViVnk2bHlMMU5oUzlz?=
	=?utf-8?B?UFFhYnRkWkREUEpGNmdxc0NzUy8rS2lKZ1dnT09GZEF3L3Ntd3dPUVVKd1ln?=
	=?utf-8?B?U2huWkV3RUVRR1U1dFRweWM1b2dIdTlCQ2ZCUDZuU3IyRUI3dzdncm9wRnNz?=
	=?utf-8?B?NmJzUTB4c1g0SjlSTUg3ZWU5alR1cHZXN2VjNkVTU1YvYURGWVRiOEN3UmpI?=
	=?utf-8?B?Z1hQQUN5Y2gzMkI5aittbjBxdTZZMDJlMkRqMElvWlpqUGlweWFpNmxIZ0lj?=
	=?utf-8?B?cUI2T2ZwZWZVTlM0SFRSWURYeUlWT2YxbTBhb2lKcmhnNERtemM4YlFaZ08z?=
	=?utf-8?B?Z0ozSkp3VDB1TEZpZFJ3bnp3T3JET1NKaFU4VTlaYko4N1NkOWRhYk9vdTJ2?=
	=?utf-8?B?TVMvaTVFb2dlTDNkTU1WVEtIbFhQb0UzV3dZcmZKZGNmaEtXUDRrclhPU01r?=
	=?utf-8?B?K041U3JtSXVVZEhESFp0a0pqem0wVVBZSHk4QjVlWVZwWjZoZzZvZHpyRHNm?=
	=?utf-8?B?b1hCUT09?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7416.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e884dd21-3daf-4af9-0e59-08db5dcb5486
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2023 09:26:48.0711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8YbwVu9/6jYedKGHKxdSAuHlGBV1szSyE27Y37/I/1j5GnXYCcQcCWejFcqzKpRJV4zBEljkg5+oQd3Aah+3I5itrlgf6LdN4iXrNYhgqT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR04MB8712
Cc: "p.raghav@samsung.com" <p.raghav@samsung.com>,
	"linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
	"rohan.puri@samsung.com" <rohan.puri@samsung.com>,
	"da.gomez@samsung.com" <da.gomez@samsung.com>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>,
	"willy@infradead.org" <willy@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>, "hare@suse.de" <hare@suse.de>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"rpuri.linux@gmail.com" <rpuri.linux@gmail.com>,
	"kbusch@kernel.org" <kbusch@kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Subject: Re: [Drbd-dev] [PATCH v2 0/5] block: simplify with
	PAGE_SECTORS_SHIFT
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 26.05.23 09:33, Luis Chamberlain wrote:
> A bit of block drivers have their own incantations with
> PAGE_SHIFT - SECTOR_SHIFT. Just simplfy and use PAGE_SECTORS_SHIFT
> all over.
>                                                                                                                                                                                               
> Based on linux-next next-20230525.
> 
> Changes since v1:
> 
>  o keep iomap math visibly simple
>  o Add tags for Reviews/acks
>  o rebase onto next-20230525
> 
> Luis Chamberlain (5):
>   block: annotate bdev_disk_changed() deprecation with a symbol
>     namespace
>   drbd: use PAGE_SECTORS_SHIFT and PAGE_SECTORS
>   iomap: simplify iomap_init() with PAGE_SECTORS
>   dm bufio: simplify by using PAGE_SECTORS_SHIFT
>   zram: use generic PAGE_SECTORS and PAGE_SECTORS_SHIFT
> 
>  block/partitions/core.c          |  6 +-----
>  drivers/block/drbd/drbd_bitmap.c |  4 ++--
>  drivers/block/loop.c             |  2 ++
>  drivers/block/zram/zram_drv.c    | 12 ++++++------
>  drivers/block/zram/zram_drv.h    |  2 --
>  drivers/md/dm-bufio.c            |  4 ++--
>  drivers/s390/block/dasd_genhd.c  |  2 ++
>  fs/iomap/buffered-io.c           |  2 +-
>  8 files changed, 16 insertions(+), 18 deletions(-)
> 

Hey Luis,
I've found another one in sd_zbc_revalidate_zones():

	max_append = min_t(u32, logical_to_sectors(sdkp->device, zone_blocks),
			   q->limits.max_segments << (PAGE_SHIFT - 9));

Mind taking care of it in the next round as well?

Thanks,
	Johannes
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

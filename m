Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D778B4AEDC6
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Feb 2022 10:17:02 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DADC8420636;
	Wed,  9 Feb 2022 10:17:01 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1085 seconds by postgrey-1.31 at mail19;
	Wed, 09 Feb 2022 10:16:57 CET
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 54DF84205EC
	for <drbd-dev@lists.linbit.com>; Wed,  9 Feb 2022 10:16:57 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=B7vW21u9A+TxQrdNVrVOWmfSRJVx6fpjdLvAU0shORyhv6vl8aJREapAqR1XGHFx57ORK0XPAJWtfbNMgBt4fimjDoDfeC3Ic0gWr+50cHim2FVQ6ITcLYPafgUIWwfb/qm3lD50im5gLvxdjFyY/ai0QI6VSeB4q4rxvO0uEgH4xQ1P4sQe/PXwY8OmW4NybQywu2mlCICKYvgbHmpXjjzVpjo59mMmAlWVRwiRjWxwMPQOm/UwwG2s15XPF1QANokAff64WUEuWbcFr1hHSo00hw9dqfScvsS+zY+XPmNV8qZJvXH8pp4FcwmpTB2SR+WoHjg2WUtiB05rFRGo9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=9Uu2cAzG7N0FZEAGYwDgcmDykXoOyLTwFFxsO67Qla4=;
	b=T+nJOhKpEpRIdvUpayc0xGW7tpG0N9Yql4jWiiZG1Q70joVlCyQzrGsJ4pHfVXQ9poIOZg2hpiEAFSqyENyiL69bfmeUtvYbzm8r/IAm6E2Q5/aioFzhkQoEdIyIwDM2/3A5x8vSZpUwrLIH0mjVHt2ZkFndfPitzP9g6cZxwsmnUGppbtW1y1CoVxgqVT8OjH8pmAbPE8N/m8Snn512/0MlUgENFNJBY1D7RsBPazoSBHL/sXSMIN29H569JLOHdRCKCxxB3wQP6RE1jflO4AzhDxKu4NAd9tB5g2f3chbZjvTSf0V2WR8YP3hpWBu+lISLB2Tcm92HZPlyKAK64g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
	dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9Uu2cAzG7N0FZEAGYwDgcmDykXoOyLTwFFxsO67Qla4=;
	b=CDsBQXOEUXL+mfSQRCt7XEBccCMWeFZemB/lpcI17cwvMVCtPVZVZgFwzTqxRUh2Tdt1CKHKH6F4Xhu5ricu37v6h/6P/5hwk86Cz+7XaXRVuTEJ9c0MJxp4DVbNXCQ1/sbcC2B1GDy3xw6i+MQGB0eEZDRe0oPQrbAUW+3SznHKEkBpdsj6E6F8DtetLArQx7zSvnWnT3IJSPyJxtW8d+Njo8cXEDUq5pLDzZSW08lhDnu6uUHM3sZL7Nmc28XBY5OjDfLGryQLPbNrdRB5NLQJXyZPgleEfnilhYrkdTapOY03QmTP5E/Ng+c2cpi+jqWkPam4ZWwqDdntxtVdtg==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
	by DM6PR12MB4910.namprd12.prod.outlook.com (2603:10b6:5:1bb::9) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11;
	Wed, 9 Feb 2022 08:43:31 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
	([fe80::846c:d3cd:5a30:c35]) by MW2PR12MB4667.namprd12.prod.outlook.com
	([fe80::846c:d3cd:5a30:c35%5]) with mapi id 15.20.4951.019;
	Wed, 9 Feb 2022 08:43:31 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, "axboe@kernel.dk" <axboe@kernel.dk>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"philipp.reisner@linbit.com" <philipp.reisner@linbit.com>,
	"lars.ellenberg@linbit.com" <lars.ellenberg@linbit.com>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"haris.iqbal@ionos.com" <haris.iqbal@ionos.com>, "jinpu.wang@ionos.com"
	<jinpu.wang@ionos.com>, "manoj@linux.ibm.com" <manoj@linux.ibm.com>,
	"mrochs@linux.ibm.com" <mrochs@linux.ibm.com>, "ukrishn@linux.ibm.com"
	<ukrishn@linux.ibm.com>
Thread-Topic: [PATCH 1/7] cxlflash: query write_zeroes limit for zeroing
Thread-Index: AQHYHY8QM/uAF/9rJU2uXlr6tMxNBayK5xsA
Date: Wed, 9 Feb 2022 08:43:30 +0000
Message-ID: <eea79469-a9d7-b80f-ef72-da9b4f4ecfff@nvidia.com>
References: <20220209082828.2629273-1-hch@lst.de>
	<20220209082828.2629273-2-hch@lst.de>
In-Reply-To: <20220209082828.2629273-2-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
authentication-results: dkim=none (message not signed)
	header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c1cefde-e8ec-4a9b-1571-08d9eba84000
x-ms-traffictypediagnostic: DM6PR12MB4910:EE_
x-microsoft-antispam-prvs: <DM6PR12MB49106BCACA9EBDEF793950C7A32E9@DM6PR12MB4910.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E3dYK8VHYi/7CR0QybZDDlLnhRy59Co5DeyfByop7w7NtDvauhViYePIEQ24rqH/0S839Av9hwT0nQmghkALWM8NfRAGszDQV5AmIkOIQDiO0rqKn+FKRAjoEDMKvqlZZ0HZlU7Hf/7+wFjBm0mQCyZ1csOinh05f9LpT0BGmE5dyP69KtgWrsQKqraB3Y/Ao3q/rZXcqw9CthCw55l8vTsoSTFlgFkpkTqPCS9zqjqLrOe72Pw4lNzXt7KMay2yJHSp216KwmB2Ms2y6dEm2pMCumPCuDurJemiEUGLS5lZDi7KQRqt2p++f2xzgEEEYfmgp9BPjb7gxVfzyXVIqibd5EOSdCMupSDlv0MbLMB0E8bPr4Zjsk20SZqsr1OVw8NhkQD1MIo3rkuBtW+kXqy2Wez3kSzdRfIGmgTn4/Wh8V9TNvm8NVYhTnrolJKAznIJB5I9C8GEUkdmANLHHqCn1fF5Xrn3L6nPI1G1fygZUFCgwzr9u6RJNUX9IJBj4uFkfIz6e7EA2NEWTZ3kLse8s7C80wW2WHIffEa7AADvg16+fsrhyY97tvBJ6S1i4pv4qBVl+j0YoBfhku2z7A9qZzp+9rrf9B1tGcWvC7ESfkY/5d6ZXzdiOcPrnrQVxzOZ+bltESiRyLUfkTCwUSTBagAujvH+HnBT0XS9kp4I1jROv2Bu+Ae71Li8Cl9gWMC7cXVoJeq7wDp46qWBvFUHDYM/7qIJeRYrosNrsPRx5+FdPG3n8wrwXgQEfv2qk0vG4IJKIPr2HSaohNZsuKqy4S50ESf81/mRZOEoSyg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230001)(4636009)(366004)(6486002)(508600001)(53546011)(2616005)(83380400001)(36756003)(31686004)(71200400001)(6506007)(76116006)(316002)(8936002)(4744005)(31696002)(7416002)(38070700005)(5660300002)(186003)(122000001)(921005)(110136005)(54906003)(38100700002)(91956017)(6512007)(8676002)(4326008)(64756008)(86362001)(2906002)(66476007)(66946007)(66446008)(66556008)(43740500002)(45980500001);
	DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ak1NMjArK085cFJHMHRmL1d4a0RiS3Y0c0ZlNXh2Q3VQZGJwSTYzckdIUGN4?=
	=?utf-8?B?UFowVDJIVEw4NmRIYkFkcG9TaXpCM0xSZERqM2k5RE0rNVJOWExpandKM0wz?=
	=?utf-8?B?QWxDYnZKQzRXV2t2bGpYeXEyblZxM25NTVNpQVlOMDJvWFJMNGJNTlJBSHJt?=
	=?utf-8?B?dktIREUvbEFXTzdtSXJzVW1KZm1DNUduancxOGNsYzRXbTVtcm5nWnljRlF0?=
	=?utf-8?B?MC9YNVVSZnMyNUhRaStZODNFNDJrZDBaMmsrVXF3WlAxa2MxUStKVWpTWHhK?=
	=?utf-8?B?MGQ3emJKRURoaHB2YWZKbFlHZElEc0ZaaG1SNXJndXVUSVlMQkpkWnFsQW1p?=
	=?utf-8?B?dzZOV3ltaFJzL2Y4c2graWF5WUhmVHYvYXg3dXA4eFFFUWdRTXJYVjZ4dkp5?=
	=?utf-8?B?UEdHNzkwbUdPdzRPN2FOdTdNZDBmMzB2UnFzWXhYRXlpbDE5anZzNDR1V0Rn?=
	=?utf-8?B?d2pkL3RlZjIvNlJuV3lnMjhUcDlCWFVEdGFUcVlITjdWNURuQmVoUEpEQW5h?=
	=?utf-8?B?OXJ0ZVhYT2VJbFZtVzlFdkhqV0hTdnRLcm1FbDNpS2VqSEx4dTVuUmZ1Vml1?=
	=?utf-8?B?NG5NaFpTcDRHbm5Ld1hucHpWVkFTOWtTN2dkelplSjlPQzBOQ1NlSzF2SGht?=
	=?utf-8?B?cWhGTGlwVkNVRzlrd1FxMmRjd1R4cTZvbkw0VFNCNzFBaTl5VEcwUFFzbHIv?=
	=?utf-8?B?VmRZZitzWkhkNnRsTE5FSjNpSFVFdllOMkdjNEE0bzN5YjR4d1ZuQSs4KzVp?=
	=?utf-8?B?UTR4YkRhajFtMU9LSEV6NHR2eGczQmZCRGNKYWpEdWFyU1FZZXlsWTNZbG1S?=
	=?utf-8?B?T3g0WXdKUzJob0o1c2ErZVdmUUxlRDlWcW9mZjdIeG5pSFhHTWdPYW0wZm5p?=
	=?utf-8?B?YnFDaGJhOHR3MHR5SFNBYUdtREx2dXVLazFYb2NyVXk3bGlvMVRPSlRpaTNj?=
	=?utf-8?B?T2R0TTNGQXJWVEZud3JQa0xBaWpLUjEzbUpsTXRSMDl4clNPamtNMVRQNmJl?=
	=?utf-8?B?cU1YSnQ0dWtEdUR1U2JxMjZTWkd1bzZDMzMwWFgwV25sRUJnY0dpNzlLZExr?=
	=?utf-8?B?ZG52d1BQZFU0TUtNaS80TkxndElvUTgrYmtsOUQ4U1hIK0tkdnBzL2lqK0xB?=
	=?utf-8?B?blowWWRsU093N3czeTZpNDRPTGxiSHZCdFJKR2paN0lMNkUzWDhHMGpDSXBO?=
	=?utf-8?B?NEIyUmVwSTh2eVJTMTZNbG5hQ0plaUw0bjV0Z3VpL1BueWlvZklUd0JLd1Av?=
	=?utf-8?B?S0MyZ2ZNa1k1ZEJqMGNLUTVZeDYzbWVZT2IrU1lRaU8vMTdiZjVGa1kvQWtU?=
	=?utf-8?B?bWtqQXlqc2ZWODJ6K2pxUTRHeVYraFptdFJRYnFlOFI1NmsrUmlkYzhBRzV1?=
	=?utf-8?B?c2RlcXQzdjZieWplSWZqYnphRDVhTGFuYnU3NmlyNkhiMkJHb0EybU1rSzYr?=
	=?utf-8?B?MjlnNUtMUDFmaGhsL2gyNU11UnRnOWRkQnJYM2F6NU5Ga3ZQRjUxNXV5Nk8w?=
	=?utf-8?B?VWpJUFZRZVI3UE90SHRTeGVhdjJuUEkyMFFXMlovVHFTcG1tanU5b1IzV2xq?=
	=?utf-8?B?SGlmbS9zSUhMdCtvV3JCQTZ3c2dJV3lHcnhab2UzT3BMRkFSbGVLRGJzaEVw?=
	=?utf-8?B?bjFzNTVra3hHaWlaOHJySXVUem0wN080eGh1WC9tQ3lmSWFFK2FmVngyUWhi?=
	=?utf-8?B?aGJvdFVFRTBlY0VpSzFmYUhhWGEvLzNtMFIxYVMrN0FTQjVoMVhVejVVVkVU?=
	=?utf-8?B?bFRlcjdZMVRVOFl0U3FZWElDQ2UvZnorR1h0VHY3djV0RjVhY0ZaU0gzQkpK?=
	=?utf-8?B?VldRY0EzbzdMeXRJOEN6M0VnYWNRclA0UG9EdFNTaHZBSmYvL000S1czTTF4?=
	=?utf-8?B?MEVIc0ZaKzRBc3IyUmJ0R0lvR3NiVkpQcVRja3lRWlZkb25WaEc2cUFMSU1t?=
	=?utf-8?B?Wnk3ZmlhWUNXNnZFcGJNWm5yWlYzRHJUWjU4T1U4SktxYUhyMWFtZGtPaGJ6?=
	=?utf-8?B?ZlhHN3hEbmNHTFpNdmsvTUpJc0R5NHNSeHNnbWxUdzhIYTBiZFRpTDEvQXJX?=
	=?utf-8?B?NGhKMmlERDVjRUhIY1VWM2FzSGNuWUZSUkRHQnJsYlN3R3RIV21OcitqdjlE?=
	=?utf-8?B?aUdLanJTV3Vkamg3NG9TRDdLSHh6cDFna1pkWWtzTnNHNGJJRTBnbVduZ2lI?=
	=?utf-8?Q?HeYpDc0YlfkWQ1PHi2TlLzQ+kCrxXSjjS0iOObPqzxoz?=
Content-ID: <CB74BD47A71E634E956120B732D5F90A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1cefde-e8ec-4a9b-1571-08d9eba84000
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 08:43:30.9635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o9XIwn5bPHr5xJ+Vwxg48S/Q77AULe0t2p8dWv22AMoa0tTgiAZcbcL20faZ3nZbIklqTabXJEf23EnTBseOjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4910
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Subject: Re: [Drbd-dev] [PATCH 1/7] cxlflash: query write_zeroes limit for
	zeroing
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

On 2/9/22 12:28 AM, Christoph Hellwig wrote:
> The write_same and write_zeroes limits for SCSI are effectively the
> same, so the current code works just fine.  But we plan to remove
> REQ_OP_WRITE_SAME support, so switch to quering the write zeroes
> limit for a zeroing WRITE SAME operation.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

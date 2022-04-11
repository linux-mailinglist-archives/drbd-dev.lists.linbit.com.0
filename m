Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5004FD35A
	for <lists+drbd-dev@lfdr.de>; Tue, 12 Apr 2022 11:36:57 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 414804203DF;
	Tue, 12 Apr 2022 11:36:55 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 339 seconds by postgrey-1.31 at mail19;
	Mon, 11 Apr 2022 14:09:52 CEST
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1AF704201D4
	for <drbd-dev@lists.linbit.com>; Mon, 11 Apr 2022 14:09:51 +0200 (CEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id
	23B9NnvU025178; Mon, 11 Apr 2022 12:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
	h=message-id : date :
	mime-version : subject : to : cc : references : from : in-reply-to :
	content-type : content-transfer-encoding; s=pp1;
	bh=gYNUMVwDP13qlMS4+UHaJJ3PaCFPgROQJTYtqXnOX7M=;
	b=RDqgcHKph8Jm2BhrynHRzlAqx8nGWKQVGDEreK7n+J6njlw2fY/eROIb0LG1Go0keNpO
	U7B7ao4FH0/uzQKEPYrHVhNG/pJ2E7Z6UBEEa2SxZlUdVDQJZ6TEFr72vPR9TSXOEBKG
	MqlChSHpWchCsB0wZHoGw70dgQSIwe1Dr/3iyUd7QHcinyuGvNuFdGbEFCrbqw9Rsc9z
	JkcowV5iFVIqo42z4/eOag4ZGEVEYQqZe/457g+H8egdMxH/HXBM9/jRkB0BPaAeZihE
	GFX1OIArRJYPFHkICDQZB90KgaeOXTtU3/g2gqArNZA/NmuhAbDjv3WPLEAFQ6zGE6gp
	Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3fchnqtx4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 11 Apr 2022 12:03:59 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23BAmtcM013717;
	Mon, 11 Apr 2022 12:03:58 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.99])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3fchnqtx39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 11 Apr 2022 12:03:58 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23BC3gZm003276;
	Mon, 11 Apr 2022 12:03:54 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
	(b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3fb1s8u242-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 11 Apr 2022 12:03:54 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 23BC40Q146596476
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 11 Apr 2022 12:04:01 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1327BA4065;
	Mon, 11 Apr 2022 12:03:52 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C9DE7A404D;
	Mon, 11 Apr 2022 12:03:50 +0000 (GMT)
Received: from [9.145.81.78] (unknown [9.145.81.78])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 11 Apr 2022 12:03:50 +0000 (GMT)
Message-ID: <e971095e-1015-c348-3c24-114193ee5ff0@linux.ibm.com>
Date: Mon, 11 Apr 2022 14:03:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.5.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20220409045043.23593-1-hch@lst.de>
	<20220409045043.23593-25-hch@lst.de>
From: =?UTF-8?Q?Jan_H=c3=b6ppner?= <hoeppner@linux.ibm.com>
In-Reply-To: <20220409045043.23593-25-hch@lst.de>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fq1U6p5RSJi3IUi0XnNkXpRDl0Ogb6A0
X-Proofpoint-ORIG-GUID: D9QlKI8GujOSuLx30db3fYGBx6ksQFZ5
X-Proofpoint-Virus-Version: vendor=baseguard
	engine=ICAP:2.0.205, Aquarius:18.0.858, Hydra:6.0.425,
	FMLib:17.11.64.514
	definitions=2022-04-11_04,2022-04-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	mlxscore=0 priorityscore=1501
	impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
	adultscore=0 clxscore=1011 mlxlogscore=999 suspectscore=0
	malwarescore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2202240000 definitions=main-2204110067
X-Mailman-Approved-At: Tue, 12 Apr 2022 11:36:53 +0200
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org,
	linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
	xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
	linux-um@lists.infradead.org, nbd@other.debian.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	ceph-devel@vger.kernel.org, Coly Li <colyli@suse.de>,
	linux-raid@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 24/27] block: remove QUEUE_FLAG_DISCARD
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

T24gMDkvMDQvMjAyMiAwNjo1MCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gSnVzdCB1c2Ug
YSBub24temVybyBtYXhfZGlzY2FyZF9zZWN0b3JzIGFzIGFuIGluZGljYXRvciBmb3IgZGlzY2Fy
ZAo+IHN1cHBvcnQsIHNpbWlsYXIgdG8gd2hhdCBpcyBkb25lIGZvciB3cml0ZSB6ZXJvZXMuCj4g
Cj4gVGhlIG9ubHkgcGxhY2VzIHdoZXJlIG5lZWRzIHNwZWNpYWwgYXR0ZW50aW9uIGlzIHRoZSBS
QUlENSBkcml2ZXIsCj4gd2hpY2ggbXVzdCBjbGVhciBkaXNjYXJkIHN1cHBvcnQgZm9yIHNlY3Vy
aXR5IHJlYXNvbnMgYnkgZGVmYXVsdCwKPiBldmVuIGlmIHRoZSBkZWZhdWx0IHN0YWNraW5nIHJ1
bGVzIHdvdWxkIGFsbG93IGZvciBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVs
bHdpZyA8aGNoQGxzdC5kZT4KPiBSZXZpZXdlZC1ieTogTWFydGluIEsuIFBldGVyc2VuIDxtYXJ0
aW4ucGV0ZXJzZW5Ab3JhY2xlLmNvbT4KPiBBY2tlZC1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVy
IDxjaHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0LmNvbT4gW2J0cmZzXQo+IEFja2VkLWJ5OiBD
b2x5IExpIDxjb2x5bGlAc3VzZS5kZT4gW2JjYWNoZV0KPiAtLS0KCkZvciAKCj4gIGRyaXZlcnMv
czM5MC9ibG9jay9kYXNkX2ZiYS5jICAgICAgIHwgIDEgLQoKQWNrZWQtYnk6IEphbiBIw7ZwcG5l
ciA8aG9lcHBuZXJAbGludXguaWJtLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxp
bmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1k
ZXYK

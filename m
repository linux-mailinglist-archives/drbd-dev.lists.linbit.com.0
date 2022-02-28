Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 408004C61E9
	for <lists+drbd-dev@lfdr.de>; Mon, 28 Feb 2022 04:43:38 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 186CA420323;
	Mon, 28 Feb 2022 04:43:37 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
	[205.220.177.32])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7B28B4201F2
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 04:43:35 +0100 (CET)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id
	21RN6iMX030439; Mon, 28 Feb 2022 03:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=from : to : cc :
	subject : date : message-id : in-reply-to : references : mime-version :
	content-type : content-transfer-encoding; s=corp-2021-07-09;
	bh=cGeTb2RuP2oaCX6gUNMtqAjcd1HT1sSNAQ3gzIXHkjM=;
	b=oW0+ymhrKEa9jL5RBdE6KXkg8zDE4Ql71nTbfC2aFQ+h3ENFDs3JxHEHgoz9pLuZ/WtQ
	TcnX1lmQYEocsN/eRsfxDDlpFi6Q5nHXiroVS3pUjMm46iET3vR/5AjZEdENCKFJ9PkJ
	x4a6WFvt+TnRuJke86fFoMBtonKYoznI64/8va2/7qG09XpxAd8qXPvqW6Qg/JnnqvZd
	vh/gj+nKIxrNg5ipDub9aSahZFw8MG3MmlzzfHX81qqBRXl9oDNuPFJMwrmlkD4XJ6xm
	0dqWuA4DlnmjwgncCs27uTp90LuLAfw2dzhGJXgboV7XufHwRwnLGzVW4qFUi/sHoDEH
	wg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by mx0b-00069f02.pphosted.com with ESMTP id 3efamcb0p4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Feb 2022 03:43:30 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21S3b93E157706;
	Mon, 28 Feb 2022 03:43:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3030.oracle.com with ESMTP id 3efa8bxnug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Feb 2022 03:43:29 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 21S3hPvs165853;
	Mon, 28 Feb 2022 03:43:29 GMT
Received: from ca-mkp.mkp.ca.oracle.com (ca-mkp.ca.oracle.com [10.156.108.201])
	by aserp3030.oracle.com with ESMTP id 3efa8bxnt3-5;
	Mon, 28 Feb 2022 03:43:29 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: mrochs@linux.ibm.com, ukrishn@linux.ibm.com, target-devel@vger.kernel.org, 
	manoj@linux.ibm.com, Christoph Hellwig <hch@lst.de>,
	haris.iqbal@ionos.com, jinpu.wang@ionos.com, axboe@kernel.dk,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com
Date: Sun, 27 Feb 2022 22:43:19 -0500
Message-Id: <164601967778.4503.10049578815707749914.b4-ty@oracle.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220209082828.2629273-1-hch@lst.de>
References: <20220209082828.2629273-1-hch@lst.de>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: Hzm0aRNfu-eOe-59CsGUww_0uF29UVaY
X-Proofpoint-GUID: Hzm0aRNfu-eOe-59CsGUww_0uF29UVaY
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] remove REQ_OP_WRITE_SAME v2
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

On Wed, 9 Feb 2022 09:28:21 +0100, Christoph Hellwig wrote:

> Now that we are using REQ_OP_WRITE_ZEROES for all zeroing needs in the
> kernel there is very little use left for REQ_OP_WRITE_SAME.  We only
> have two callers left, and both just export optional protocol features
> to remote systems: DRBD and the target code.
> 
> For the target code the only real use case was zeroing offload, which
> is kept with this series, and for DRBD I suspect the same based on the
> usage.
> 
> [...]

Applied to 5.18/scsi-queue, thanks!

[1/7] cxlflash: query write_zeroes limit for zeroing
      https://git.kernel.org/mkp/scsi/c/898cd34607eb
[2/7] drbd: drop REQ_OP_WRITE_SAME support
      https://git.kernel.org/mkp/scsi/c/a34592ff6b78
[3/7] rnbd: drop WRITE_SAME support
      https://git.kernel.org/mkp/scsi/c/ebd04737637b
[4/7] sd: remove write same support
      https://git.kernel.org/mkp/scsi/c/e383e16e84e9
[5/7] md: drop WRITE_SAME support
      https://git.kernel.org/mkp/scsi/c/10fa225c33a9
[6/7] dm: remove write same support
      https://git.kernel.org/mkp/scsi/c/a773187e37fa
[7/7] block: remove REQ_OP_WRITE_SAME support
      https://git.kernel.org/mkp/scsi/c/73bd66d9c834

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

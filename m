Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 974792AB167
	for <lists+drbd-dev@lfdr.de>; Mon,  9 Nov 2020 07:45:40 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DEE114207BE;
	Mon,  9 Nov 2020 07:45:36 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 410 seconds by postgrey-1.31 at mail19;
	Sun, 08 Nov 2020 16:22:01 CET
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CE73242064D
	for <drbd-dev@lists.linbit.com>; Sun,  8 Nov 2020 16:22:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604848921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=xCiEM7AQz5QZ2RvY5C0nr85g19BsqN3bEHGGJWjun8g=;
	b=XPCFP7RYHbnD7kj/804c8s0JC7ynjO8KoFCN9yZzm8o4ctBwsYFgRZRC7l0lA+J1li2Rnu
	qu/0zgSOwv0indXfwYlu2L4d+Fp61hs0jxqpKCv3zawFjtDDhbbPNyWCKwl1ABApC672/0
	o4OpIHMM2S3fDLUI83jxU05F9XswBEk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
	[209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-419-lNBUjj_tOBeg0MtqxmQ4XA-1; Sun, 08 Nov 2020 10:15:09 -0500
X-MC-Unique: lNBUjj_tOBeg0MtqxmQ4XA-1
Received: by mail-wr1-f70.google.com with SMTP id v5so3088412wrr.0
	for <drbd-dev@lists.linbit.com>; Sun, 08 Nov 2020 07:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xCiEM7AQz5QZ2RvY5C0nr85g19BsqN3bEHGGJWjun8g=;
	b=DuK/vsbFIi5KyLtm2CdmbdpWZacJa4/0D1HIezCNtt7BaAXlF1lzsd8EyC3gVmuhwo
	BLJMk4bZg2UB9w7nQ8zn1hiB9uDDW/urkZ9xDQWueSR9IXATZw7L5J9z0NRez5sPmUdo
	iYlfEiB0Neb2vEwwsaqmxsfHgAELmInA02f0Tp8ilbDQM6Xj/CdmY7v0ZjTFfXmbwUoN
	OmhIb53uyrby1SBHF7MsWB0ibi1I0wXcCY/ciQ7UJdt4gQ7awId5y/TgeRECBwT5C7V6
	F9KTBpRQBpZZpV4fh9UZ4auL3Uoyefkmj+v9afokL4leqt4cgZ6MJExKCS3KrL18HDBx
	YfmQ==
X-Gm-Message-State: AOAM530Ol3PrkDs+HM/zf+iqFpuFtrR0UI6oT/7HK7c7XrdRsimlACq7
	RrTGwrtrvCqyTxE7OCRs6DCzWqA5kcLjZWyQiJvf7LU5wlGoXbvc2F7vtJF1JIHSKIDS4tv8fsf
	GaQJ2sXAIzhKSuNBx6MSw
X-Received: by 2002:a1c:80d3:: with SMTP id
	b202mr10142613wmd.139.1604848507854; 
	Sun, 08 Nov 2020 07:15:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBz6wtcRAgwxrEGiAL8ElHcOzDdD7qQjz/7QuIFGOGrDkKJazoMrCqH8844xWODBZg8NNGyg==
X-Received: by 2002:a1c:80d3:: with SMTP id
	b202mr10142589wmd.139.1604848507695; 
	Sun, 08 Nov 2020 07:15:07 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
	([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
	by smtp.gmail.com with ESMTPSA id
	l3sm11508325wmg.32.2020.11.08.07.15.05
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 08 Nov 2020 07:15:06 -0800 (PST)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201106190337.1973127-1-hch@lst.de>
	<20201106190337.1973127-24-hch@lst.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d23bd50a-7555-438b-9e3b-131414b2d1a5@redhat.com>
Date: Sun, 8 Nov 2020 16:15:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201106190337.1973127-24-hch@lst.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Mailman-Approved-At: Mon, 09 Nov 2020 07:45:34 +0100
Cc: Justin Sanders <justin@coraid.com>, Mike Snitzer <snitzer@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	drbd-dev@lists.linbit.com, linux-scsi@vger.kernel.org,
	xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
	ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Minchan Kim <minchan@kernel.org>, linux-fsdevel@vger.kernel.org,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Subject: Re: [Drbd-dev] [PATCH 23/24] virtio-blk: remove a spurious call to
 revalidate_disk_size
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 06/11/20 20:03, Christoph Hellwig wrote:
> revalidate_disk_size just updates the block device size from the disk 
> size. Thus calling it from revalidate_disk_size doesn't actually do 

s/revalidate_disk_size/virtblk_update_cache_mode/

> anything.

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

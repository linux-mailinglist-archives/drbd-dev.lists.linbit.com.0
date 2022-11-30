Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1225963D701
	for <lists+drbd-dev@lfdr.de>; Wed, 30 Nov 2022 14:42:55 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 79F96421748;
	Wed, 30 Nov 2022 14:42:54 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 380 seconds by postgrey-1.31 at mail19;
	Wed, 30 Nov 2022 12:55:05 CET
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 54634420FC2
	for <drbd-dev@lists.linbit.com>; Wed, 30 Nov 2022 12:55:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669809304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=ew+rmcqxH2n7lRVyzxgZ+S2EuF0zHGkt1auf+7rBZUw=;
	b=E/Teuz2xWkO9eeCduv32DkS4WDeQyZNtcrjnvd4rfQ+NKTv1pN08ybOcoCMN+DZLVq7UPF
	QGmxyzw1TpeFKR6KcdT/RXv3tOys4Kjr0SLgV3R/ihFKRHcuDWubEVnI/vWEnBOGey714A
	nX79yu5WjPm+wYP2mg55920vA1UDSs8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
	us-mta-218-gmbm5RXxOV6WTEEShywhcA-1; Wed, 30 Nov 2022 06:48:40 -0500
X-MC-Unique: gmbm5RXxOV6WTEEShywhcA-1
Received: by mail-wm1-f72.google.com with SMTP id
	204-20020a1c02d5000000b003d06031f2cfso3143469wmc.0
	for <drbd-dev@lists.linbit.com>; Wed, 30 Nov 2022 03:48:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=in-reply-to:content-disposition:mime-version:references:message-id
	:subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=ew+rmcqxH2n7lRVyzxgZ+S2EuF0zHGkt1auf+7rBZUw=;
	b=EW7qJZC9i/nGyn2D8cFdFXdPf59SthyBbfZDOK2GuDiHqaP0/UF+MdnmZI8YJcnMik
	VbYVxoNMK4w7EnonHrEA7NZcsC7OEgsmQXA//ckDvH+afLjGuIY1Z4bVZL8UV6CdDMLP
	o4A2YZmSpJAjfyrMGbGZ3HT6eF/fMtqZKQawnQLE2BKUVbhHJVlU6wxfpUHDNRhQx/Vb
	eJZ1DkXeyrc7g6wqiKgpqxnB+fqecN8Ji5NsaYIAuZNWtHUe4p3xBWnly3qkO6WSC+cp
	ImeHrnr3FeJJNmLpBEtsEaQXpILWazHcu6cFg9YAUHcoVmgkK9mFizxWVsHMzvsmQk48
	g2+w==
X-Gm-Message-State: ANoB5pkCGTmBaWDVN/4UAUlExDevDr+X3tsw+Uyv9M67+BgMdNxBNX8E
	iL96ZO+w342RHrPK2SrFfraunAHRzDDoHjePlsHd6GdNmIbQHkzmOCPhMuLZPBQQPwV8TfqPQYE
	UKbPoAKzczzB4/osacFlA
X-Received: by 2002:a5d:5f04:0:b0:241:e9a6:fb3 with SMTP id
	cl4-20020a5d5f04000000b00241e9a60fb3mr22408112wrb.462.1669808919574;
	Wed, 30 Nov 2022 03:48:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf71i1QvnhhrXaTwa+I+8EpX/qnDqrYR4GbrQTWzEGi7bUvVncNy/xc2a74B4erNgTJKDcQn3Q==
X-Received: by 2002:a5d:5f04:0:b0:241:e9a6:fb3 with SMTP id
	cl4-20020a5d5f04000000b00241e9a60fb3mr22408062wrb.462.1669808919318;
	Wed, 30 Nov 2022 03:48:39 -0800 (PST)
Received: from pc-4.home (2a01cb058918ce00dd1a5a4f9908f2d5.ipv6.abo.wanadoo.fr.
	[2a01:cb05:8918:ce00:dd1a:5a4f:9908:f2d5])
	by smtp.gmail.com with ESMTPSA id
	16-20020a05600c22d000b003b497138093sm1620841wmg.47.2022.11.30.03.48.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 30 Nov 2022 03:48:38 -0800 (PST)
Date: Wed, 30 Nov 2022 12:48:35 +0100
From: Guillaume Nault <gnault@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20221130114835.GA29316@pc-4.home>
References: <cover.1669036433.git.bcodding@redhat.com>
	<c2ec184226acd21a191ccc1aa46a1d7e43ca7104.1669036433.git.bcodding@redhat.com>
	<20221129140242.GA15747@lst.de>
MIME-Version: 1.0
In-Reply-To: <20221129140242.GA15747@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 30 Nov 2022 14:42:53 +0100
Cc: Latchesar Ionkov <lucho@ionkov.net>, samba-technical@lists.samba.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	linux-nvme@lists.infradead.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	David Howells <dhowells@redhat.com>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Eric Dumazet <edumazet@google.com>, linux-nfs@vger.kernel.org,
	Marc Dionne <marc.dionne@auristor.com>,
	Shuah Khan <shuah@kernel.org>, linux-afs@lists.infradead.org,
	Mike Christie <michael.christie@oracle.com>,
	drbd-dev@lists.linbit.com, linux-cifs@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>, linux-scsi@vger.kernel.org,
	Mark Fasheh <mark@fasheh.com>, cluster-devel@redhat.com,
	Christine Caulfield <ccaulfie@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Anna Schumaker <anna@kernel.org>,
	Eric Van Hensbergen <ericvh@gmail.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-block@vger.kernel.org, David Teigland <teigland@redhat.com>,
	Joel Becker <jlbec@evilplan.org>, v9fs-developer@lists.sourceforge.net,
	Keith Busch <kbusch@kernel.org>, ceph-devel@vger.kernel.org,
	Xiubo Li <xiubli@redhat.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Jens Axboe <axboe@kernel.dk>, Chris Leech <cleech@redhat.com>,
	open-iscsi@googlegroups.com,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>,
	Benjamin Coddington <bcodding@redhat.com>,
	Chuck Lever <chuck.lever@oracle.com>, Lee Duncan <lduncan@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	"David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
Subject: Re: [Drbd-dev] [PATCH v1 2/3] Treewide: Stop corrupting socket's
	task_frag
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

On Tue, Nov 29, 2022 at 03:02:42PM +0100, Christoph Hellwig wrote:
> Hmm.  Having to set a flag to not accidentally corrupt per-task
> state seems a bit fragile.  Wouldn't it make sense to find a way to opt
> into the feature only for sockets created from the syscall layer?

That's something I originally considered. But, as far as I can see, nbd
needs this flag _and_ uses sockets created in user space. So it'd still
need to opt out manually.

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

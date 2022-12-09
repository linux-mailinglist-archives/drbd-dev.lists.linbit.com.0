Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BDD64A432
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Dec 2022 16:32:55 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 07490420354;
	Mon, 12 Dec 2022 16:32:55 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A0D704252E0
	for <drbd-dev@lists.linbit.com>; Fri,  9 Dec 2022 17:51:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670604673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=hEHtknj7G67yuPB9tWefZgr9ALjA/T5Vl29gdCA8cwI=;
	b=cPRI/kR8AIBHENzdjGP712YpUpmzrnR0h3fuN+pIP+/u6CWbJLpt3jMyrt44ENSnjvuz9o
	fmkFnR3u2jOo5cESzoteQXGs/Kpd3d1K9yTrFGwajlCcoqwhqWtImOPeWZQmzp1oCerDT7
	fajW5URBIu/oXApIAtl0n9k3xeaYTAc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
	us-mta-614-RmJPpWfBPbyHuaNrGSe3Jg-1; Fri, 09 Dec 2022 11:51:10 -0500
X-MC-Unique: RmJPpWfBPbyHuaNrGSe3Jg-1
Received: by mail-wm1-f71.google.com with SMTP id
	m38-20020a05600c3b2600b003d1fc5f1f80so129916wms.1
	for <drbd-dev@lists.linbit.com>; Fri, 09 Dec 2022 08:51:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:user-agent:references
	:in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
	:from:to:cc:subject:date:message-id:reply-to;
	bh=hEHtknj7G67yuPB9tWefZgr9ALjA/T5Vl29gdCA8cwI=;
	b=dlHii4db87NnpD7q84YvTuDaRL8ZA05h1RYNPWBRqKEbQYJyP7cx+aWNjU/HMAX6cn
	RPSqxK6JBYJdSorrkXWHctGI+zRneA/HCoTTsV4q+l6AJYhfGXX6pFQozkNHtPi1yqNq
	o5mueqe5ejPOjVcTJigGv5s+MFTVvFQaU9J7MI4+DQhqFXiVQaasNUnvBD4n+q9FkreX
	xhqb88Vm+05ITMMFkfIUYXp8I+yd76MAfy15G4JyfIkMqmXiLJr8xuPNqVg9s1vYQzZ8
	URYmfu8wqP9Vit57PyNwLTobWuMuwOjuSx9jig673Mr4H55D9NHVaWYHcSdfBBSBWFXj
	ELGg==
X-Gm-Message-State: ANoB5pnBK9Hs+j81vsztS65mwB1bgoQY75Ks+tmyg2HIWTSexLyKV1vD
	9xsMLRWLA0/n/4hJHSn9IE80cJF5xegXhPD0UrICpFxcX0MbDMm9hUs0bamE79N+mE+INVGpN6M
	mwMK2zdbMhWdiNSOchziJ
X-Received: by 2002:a05:600c:4f48:b0:3cf:e850:4435 with SMTP id
	m8-20020a05600c4f4800b003cfe8504435mr5700804wmq.13.1670604669154;
	Fri, 09 Dec 2022 08:51:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4vPLwblTckd8B2URRNRbKIW7VqMLQd/PWlQAHufJr6jh2xD5egmlwfWsaGwQofLy1f6L/9tQ==
X-Received: by 2002:a05:600c:4f48:b0:3cf:e850:4435 with SMTP id
	m8-20020a05600c4f4800b003cfe8504435mr5700758wmq.13.1670604668951;
	Fri, 09 Dec 2022 08:51:08 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-105-105.dyn.eolo.it.
	[146.241.105.105]) by smtp.gmail.com with ESMTPSA id
	ay13-20020a05600c1e0d00b003c6bd91caa5sm302339wmb.17.2022.12.09.08.50.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 09 Dec 2022 08:51:08 -0800 (PST)
Message-ID: <73186bd6e1ad62da16726b95b1a266c0aeb39719.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Date: Fri, 09 Dec 2022 17:50:53 +0100
In-Reply-To: <20221209081101.7500478c@kernel.org>
References: <cover.1669036433.git.bcodding@redhat.com>
	<c2ec184226acd21a191ccc1aa46a1d7e43ca7104.1669036433.git.bcodding@redhat.com>
	<d220402a232e204676d9100d6fe4c2ae08f753ee.camel@redhat.com>
	<20221209081101.7500478c@kernel.org>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Mon, 12 Dec 2022 16:32:53 +0100
Cc: Latchesar Ionkov <lucho@ionkov.net>,
	samba-technical@lists.samba.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	linux-nvme@lists.infradead.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	David Howells <dhowells@redhat.com>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Eric Dumazet <edumazet@google.com>, linux-nfs@vger.kernel.org,
	Marc Dionne <marc.dionne@auristor.com>,
	Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Mike Christie <michael.christie@oracle.com>,
	drbd-dev@lists.linbit.com, linux-cifs@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>, linux-scsi@vger.kernel.org,
	Mark Fasheh <mark@fasheh.com>, linux-afs@lists.infradead.org,
	cluster-devel@redhat.com, Christine Caulfield <ccaulfie@redhat.com>,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, open-iscsi@googlegroups.com,
	Anna Schumaker <anna@kernel.org>, Hensbergen <ericvh@gmail.com>,
	"James  E.J. Bottomley" <jejb@linux.ibm.com>,
	Josef Bacik <josef@toxicpanda.com>, David@linbit.com,
	linux-block@vger.kernel.org, nbd@other.debian.org, Greg@linbit.com,
	Teigland <teigland@redhat.com>, Joel Becker <jlbec@evilplan.org>,
	Chuck@linbit.com, Keith Busch <kbusch@kernel.org>,
	ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Axboe <axboe@kernel.dk>, Chris Leech <cleech@redhat.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Christoph@linbit.com, netdev@vger.kernel.org, Jens@linbit.com,
	linux-usb@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Steve French <sfrench@samba.org>,
	Benjamin Coddington <bcodding@redhat.com>,
	Lever <chuck.lever@oracle.com>, Lee Duncan <lduncan@suse.com>,
	Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Eric@linbit.com,
	ocfs2-devel@oss.oracle.com
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

On Fri, 2022-12-09 at 08:11 -0800, Jakub Kicinski wrote:
> On Fri, 09 Dec 2022 13:37:08 +0100 Paolo Abeni wrote:
> > I think this is the most feasible way out of the existing issue, and I
> > think this patchset should go via the networking tree, targeting the
> > Linux 6.2.
> 
> FWIW some fields had been moved so this will not longer apply cleanly,
> see b534dc46c8ae016. But I think we can apply it to net since the merge
> window is upon us? Just a heads up.

We will need an additional revision, see my reply to patch 3/3. I think
the -net tree should be the appropriate target.

Thanks,

Paolo

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

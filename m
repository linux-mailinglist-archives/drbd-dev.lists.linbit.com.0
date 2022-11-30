Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0D963D702
	for <lists+drbd-dev@lfdr.de>; Wed, 30 Nov 2022 14:42:56 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A31C242177C;
	Wed, 30 Nov 2022 14:42:54 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 55C4942096A
	for <drbd-dev@lists.linbit.com>; Wed, 30 Nov 2022 13:07:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669810058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=jnVdlteFV26Z76cEF4gxE55CdPW4P3QACX8nQF2ZXTo=;
	b=W/dSB4qs5hwMfYN4TjxxFnqFD4auu9K07/woj4RDIZunyWcd9qT2g9XoFZvOSjAqfTe4Ga
	sPDuA5GKhAnz1PJtE0E805fwucXHtgi6wF0TyYucotzcJnBT4lkI2YNflsI6f5EEvixFEq
	5X6WL3hpHvkVlHRo2bXgnkAdSZ4Yo+A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
	us-mta-32-zeXY2kl5Nhi--Lj2cQdtZw-1; Wed, 30 Nov 2022 07:07:37 -0500
X-MC-Unique: zeXY2kl5Nhi--Lj2cQdtZw-1
Received: by mail-wr1-f69.google.com with SMTP id
	w11-20020adfbacb000000b002418a90da01so3490645wrg.16
	for <drbd-dev@lists.linbit.com>; Wed, 30 Nov 2022 04:07:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=in-reply-to:content-disposition:mime-version:references:message-id
	:subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=jnVdlteFV26Z76cEF4gxE55CdPW4P3QACX8nQF2ZXTo=;
	b=1yPUDUF/FuMYnAI31nKjYX+sr/HIjN8f4yhLpeANutU7BQQW630/cT+zTRIh1gaquC
	q1cJu+0Nt6HyyqbHSEFztbPElbk58XmXOkVDk7kn6v3sQ8mOTURLoAmmViu4mOXIHJI2
	GZvTAcArDIWqPeO7yqy7hTshH3mqua5NMqRqiqBIW0H3tNEY46FDL01aub71cEITifMU
	dMCrMAClYNWW/3JdvEYn4z4ZMlMGu5TfoB+6/Vi8yA7mt9EkOO8DJkNfFkNm8NK0UIOU
	zZhiqwzQN55j1kpDmaLYn1qexrJ2qq75hVhq+Ta3GKoi8SA8gavLdUMz91FEAi2P1Cgw
	OoRg==
X-Gm-Message-State: ANoB5pm1jkrIu11tLkHN24eTPvRmQVMkmTxhe5/hDKQT4glpr4hljqhV
	/2x07wdgupA+dciEOHErdDI4vKf9A8wWczLJmY3lCoIweNArf6AWX1PikYh3FzgQzilOEK7Wuny
	YlZmSf8VSVu7ahwdPR3z4
X-Received: by 2002:a05:600c:3c8e:b0:3d0:69f4:d3d0 with SMTP id
	bg14-20020a05600c3c8e00b003d069f4d3d0mr4598092wmb.93.1669810056116;
	Wed, 30 Nov 2022 04:07:36 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4PpVsPubG71ps8rgagttNzK50w8zECDxzJfF2enqQnAPQgsvcgKe3HBaErdsIeSxrgevrHjQ==
X-Received: by 2002:a05:600c:3c8e:b0:3d0:69f4:d3d0 with SMTP id
	bg14-20020a05600c3c8e00b003d069f4d3d0mr4598054wmb.93.1669810055886;
	Wed, 30 Nov 2022 04:07:35 -0800 (PST)
Received: from pc-4.home (2a01cb058918ce00dd1a5a4f9908f2d5.ipv6.abo.wanadoo.fr.
	[2a01:cb05:8918:ce00:dd1a:5a4f:9908:f2d5])
	by smtp.gmail.com with ESMTPSA id
	j3-20020adfd203000000b002366c3eefccsm1368822wrh.109.2022.11.30.04.07.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 30 Nov 2022 04:07:35 -0800 (PST)
Date: Wed, 30 Nov 2022 13:07:32 +0100
From: Guillaume Nault <gnault@redhat.com>
To: Benjamin Coddington <bcodding@redhat.com>
Message-ID: <20221130120732.GB29316@pc-4.home>
References: <cover.1669036433.git.bcodding@redhat.com>
	<c2ec184226acd21a191ccc1aa46a1d7e43ca7104.1669036433.git.bcodding@redhat.com>
	<20221129140242.GA15747@lst.de>
	<794DBAB0-EDAF-4DA2-A837-C1F99916BC8E@redhat.com>
MIME-Version: 1.0
In-Reply-To: <794DBAB0-EDAF-4DA2-A837-C1F99916BC8E@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 30 Nov 2022 14:42:53 +0100
Cc: Latchesar Ionkov <lucho@ionkov.net>, samba-technical@lists.samba.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
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
	Jeff Layton <jlayton@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
	Lee Duncan <lduncan@suse.com>,
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

On Tue, Nov 29, 2022 at 11:47:47AM -0500, Benjamin Coddington wrote:
> On 29 Nov 2022, at 9:02, Christoph Hellwig wrote:
> 
> > Hmm.  Having to set a flag to not accidentally corrupt per-task
> > state seems a bit fragile.  Wouldn't it make sense to find a way to opt
> > into the feature only for sockets created from the syscall layer?
> 
> It's totally fragile, and that's why it's currently broken in production.
> The fragile ship sailed when networking decided to depend on users setting
> the socket's GFP_ flags correctly to avoid corruption.
> 
> Meantime, this problem needs fixing in a way that makes everyone happy.
> This fix doesn't make it less fragile, but it may (hopefully) address the
> previous criticisms enough that something gets done to fix it.

Also, let's remember that while we're discussing how the kernel sould
work in an ideal world, the reality is that production NFS systems
crash randomly upon memory reclaim since commit a1231fda7e94 ("SUNRPC:
Set memalloc_nofs_save() on all rpciod/xprtiod jobs"). Fixing that is
just a matter of re-introducing GFP_NOFS on SUNRPC sockets (which has
been proposed several times already). Then we'll have plenty of time
to argue about how networking should use the per-task page_frag and
how to remove GFP_NOFS in the long term.

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

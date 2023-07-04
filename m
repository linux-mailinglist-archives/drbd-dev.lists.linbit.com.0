Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2172D747163
	for <lists+drbd-dev@lfdr.de>; Tue,  4 Jul 2023 14:30:19 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 11CA74252E9;
	Tue,  4 Jul 2023 14:30:19 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A635A42097B
	for <drbd-dev@lists.linbit.com>; Tue,  4 Jul 2023 14:28:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 37C1422864;
	Tue,  4 Jul 2023 12:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1688473345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
	bh=fmLTdco5SVuopuSHDbZ7fgiCJT9fmPtnstwBD5O0cVs=;
	b=LYS1cAt6t7JDeaXCZA2GfkFsvePsCKrBv683wLJKbeQdnB0RB5kex3lpjPlaO0WNrRIj/p
	OKov+tjGtn08tmzrJU88unG7OZdlwokmKgdGkl+OG4epxE3GA77hqhJZhG3Z0dN3YI1cPw
	0UrvrW8qrgzkAVKwdQJPDUFGAz/meEU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1688473345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
	bh=fmLTdco5SVuopuSHDbZ7fgiCJT9fmPtnstwBD5O0cVs=;
	b=Dse69eRRr1j+O/QtQVzrTyIAnqxKgXzcDp3QAv4KDKTfaZG4HjcsXtXKNaEGDfzmeYyIxx
	WQrcOQN123NhV6Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1D4941346D;
	Tue,  4 Jul 2023 12:22:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id j8gfBwEPpGQFMAAAMHmgww
	(envelope-from <jack@suse.cz>); Tue, 04 Jul 2023 12:22:25 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 915DAA0722; Tue,  4 Jul 2023 14:22:24 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-block@vger.kernel.org>
Date: Tue,  4 Jul 2023 14:21:27 +0200
Message-Id: <20230629165206.383-1-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2471; i=jack@suse.cz;
	h=from:subject:message-id;
	bh=ceZQTtdZjpsFiBb9Fva7YX0lOa2i6Zx53n9hl/3+KQM=;
	b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBkpA7DYrlV/5vfqjK0juEsCaKDoUZ39z4YDWexB9PO
	aQyP7ZaJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCZKQOwwAKCRCcnaoHP2RA2S48B/
	476l3pggtn8igKmRoHswxXv63Ks68g/08HDzIZqCtDPA84BSKd93Nq0m/Wn76G+ubHQpfg8PMw5+DG
	uV+DOTR+NEYKAToQQ8YzmS6RAGasKKWUg3k1pr7jK23l+wcq16ImmBXmWM3nr2j85QcDZeB+vpUKHh
	bdQJQsBOqKsA+qlImgVwvMS+V4UTLQcIYQo2bDBl0TIbJB0UiXYMYHcvrEkwNZWybXBs+wfERrXuF1
	XlXO6rWvLyW94kkpvaZTvPY+yZd7tOLd+W8gsz2uBFG9QJg57aDkZxf6NA+Qxf2O8uwfWiyb1XXBN8
	I1wYA/sSduibCw4tF4sYb/wERvIAO+
X-Developer-Key: i=jack@suse.cz; a=openpgp;
	fpr=93C6099A142276A28BBE35D815BC833443038D8C
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	linux-nvme@lists.infradead.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Jack Wang <jinpu.wang@ionos.com>,
	Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
	Christoph Hellwig <hch@infradead.org>,
	xen-devel@lists.xenproject.org, Gao Xiang <xiang@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-pm@vger.kernel.org,
	Mike Snitzer <snitzer@kernel.org>, Chao Yu <chao@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	reiserfs-devel@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>,
	linux-mm@kvack.org, Song Liu <song@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	ocfs2-devel@oss.oracle.com, Anna Schumaker <anna@kernel.org>,
	linux-fsdevel@vger.kernel.org, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: [Drbd-dev] [PATCH RFC 0/32] block: Make blkdev_get_by_*() return
	handle
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

Hello,

this patch series implements the idea of blkdev_get_by_*() calls returning
bdev_handle which is then passed to blkdev_put() [1]. This makes the get
and put calls for bdevs more obviously matching and allows us to propagate
context from get to put without having to modify all the users (again!).
In particular I need to propagate used open flags to blkdev_put() to be able
count writeable opens and add support for blocking writes to mounted block
devices. I'll send that series separately.

The series is based on Linus' tree as of yesterday + two bcache fixes which are
in the block tree. Patches have passed some basic testing, I plan to test more
users once we agree this is the right way to go.

								Honza

[1] https://lore.kernel.org/all/ZJGNsVDhZx0Xgs2H@infradead.org

CC: Alasdair Kergon <agk@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Anna Schumaker <anna@kernel.org>
CC: Chao Yu <chao@kernel.org>
CC: Christian Borntraeger <borntraeger@linux.ibm.com>
CC: Coly Li <colyli@suse.de
CC: "Darrick J. Wong" <djwong@kernel.org>
CC: Dave Kleikamp <shaggy@kernel.org>
CC: David Sterba <dsterba@suse.com>
CC: dm-devel@redhat.com
CC: drbd-dev@lists.linbit.com
CC: Gao Xiang <xiang@kernel.org>
CC: Jack Wang <jinpu.wang@ionos.com>
CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: jfs-discussion@lists.sourceforge.net
CC: Joern Engel <joern@lazybastard.org>
CC: Joseph Qi <joseph.qi@linux.alibaba.com>
CC: Kent Overstreet <kent.overstreet@gmail.com>
CC: linux-bcache@vger.kernel.org
CC: linux-btrfs@vger.kernel.org
CC: linux-erofs@lists.ozlabs.org
CC: <linux-ext4@vger.kernel.org>
CC: linux-f2fs-devel@lists.sourceforge.net
CC: linux-mm@kvack.org
CC: linux-mtd@lists.infradead.org
CC: linux-nfs@vger.kernel.org
CC: linux-nilfs@vger.kernel.org
CC: linux-nvme@lists.infradead.org
CC: linux-pm@vger.kernel.org
CC: linux-raid@vger.kernel.org
CC: linux-s390@vger.kernel.org
CC: linux-scsi@vger.kernel.org
CC: linux-xfs@vger.kernel.org
CC: "Md. Haris Iqbal" <haris.iqbal@ionos.com>
CC: Mike Snitzer <snitzer@kernel.org>
CC: Minchan Kim <minchan@kernel.org>
CC: ocfs2-devel@oss.oracle.com
CC: reiserfs-devel@vger.kernel.org
CC: Sergey Senozhatsky <senozhatsky@chromium.org>
CC: Song Liu <song@kernel.org>
CC: Sven Schnelle <svens@linux.ibm.com>
CC: target-devel@vger.kernel.org
CC: Ted Tso <tytso@mit.edu>
CC: Trond Myklebust <trond.myklebust@hammerspace.com>
CC: xen-devel@lists.xenproject.org

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

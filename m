Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E401E1E37F9
	for <lists+drbd-dev@lfdr.de>; Wed, 27 May 2020 07:25:43 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CA6EA4203F1;
	Wed, 27 May 2020 07:25:43 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3B21F4203C9
	for <drbd-dev@lists.linbit.com>; Wed, 27 May 2020 07:24:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=dJGZntVcW6cIG2lSncQfYFsGYe54mFNTI2kksX7wjkw=;
	b=Gx+Qc/daipt8RPO+r8id9gztxi
	Vteb8LMs4zXEDORmD+fyEMjSsBt6uIsIbBcQcQMCHQfx5ZPk130XPqxuL5xoG7ulKVYOEhpHkYHuv
	5hl1LMsAij9x/e5CnfRgBhxh/kO5GfiHa4AYylNh6rKP/x0SsOQf1sWZn/gOaO6QLBgkTG+JXvCfX
	8nUyJBg0eUXIjVyli3n2Lq0k1k22bkKOiap1xPNR5nAGhYxfB8RkqLZa43VhL6ewW5QDaIztVrsop
	rLrrKolV0WGsf2AaRGcZxXm3hNXXjPDL9E+Z8Q4wFj54mCUj31zq4i/8zwKN5vBJiM6dpmRG4CNGA
	ZYjXVKcQ==;
Received: from [2001:4bb8:18c:5da7:8164:affc:3c20:853d] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdoY9-0000me-A3; Wed, 27 May 2020 05:24:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 27 May 2020 07:24:03 +0200
Message-Id: <20200527052419.403583-1-hch@lst.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-nvdimm@lists.01.org,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	dm-devel@redhat.com, Nitin Gupta <ngupta@vflare.org>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] block I/O accounting improvements v2
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

Hi Jens,

they series contains various improvement for block I/O accounting.  The
first bunch of patches switch the bio based drivers to better accounting
helpers compared to the current mess.  The end contains a fix and various
performanc improvements.  Most of this comes from a series Konstantin
sent a few weeks ago, rebased on changes that landed in your tree since
and my change to always use the percpu version of the disk stats.


Changes since v1:
 - add an ifdef CONFIG_BLOCK to work around the sad state of our headers
 - add reviewed-by tags to all patches
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

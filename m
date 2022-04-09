Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AAF4FA3D5
	for <lists+drbd-dev@lfdr.de>; Sat,  9 Apr 2022 06:53:29 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EDFCC420FE7;
	Sat,  9 Apr 2022 06:53:28 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3341B420FDA
	for <drbd-dev@lists.linbit.com>; Sat,  9 Apr 2022 06:51:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=o0hivJC1zBmf2OLswEv2WeM9LwYiU39b8DIC3mFzVkc=;
	b=3F4Gy8p9Tvq+5pylL46uvOJn7h
	o2XZpRogXFQL3VJFZPE+ZZDtjrf9Pc2OTl5fZtGSYd57hTdFlYXIdIHOqaBXa/gwwIgNeTwpzh8E1
	QxRCn+KG2Muq11G9sBZPqcFJsQdF+RO1A1/vOYvAkvrZpiLwvpNlQupw5qXMvPBGR692SLA9Gc4O9
	+WQuMA5xQqJyH9AX6svLk38kVSqqX8kZssANUh1VF1n2HxXeQbt2B929yqhRSjrF5mSUtQQl9u3kF
	pbbIDtUGIe8ib42MP8DoNYMKEID8G4oja6vJ3M+Cjui+ZmorwUZF4pyM0UDyDdlGBMS8H8gcMK1Fa
	XnV5hFlQ==;
Received: from 213-147-167-116.nat.highway.webapn.at ([213.147.167.116]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd33w-0020Yw-4P; Sat, 09 Apr 2022 04:51:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sat,  9 Apr 2022 06:50:21 +0200
Message-Id: <20220409045043.23593-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220409045043.23593-1-hch@lst.de>
References: <20220409045043.23593-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org,
	linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
	xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
	linux-um@lists.infradead.org, nbd@other.debian.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	ceph-devel@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: [Drbd-dev] [PATCH 05/27] drbd: use bdev based limit helpers in
	drbd_send_sizes
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

VXNlIHRoZSBiZGV2IGJhc2VkIGxpbWl0cyBoZWxwZXJzIHdoZXJlIHRoZXkgZXhpc3QuCgpTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KQWNrZWQtYnk6IENocmlz
dG9waCBCw7ZobXdhbGRlciA8Y2hyaXN0b3BoLmJvZWhtd2FsZGVyQGxpbmJpdC5jb20+Ci0tLQog
ZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jIHwgMTIgKysrKysrKy0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21h
aW4uYwppbmRleCAxMjYyZmUxYzMzNjE4Li5hYTJjMjFhZWI3NDdjIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMKKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRf
bWFpbi5jCkBAIC05MjQsNyArOTI0LDkgQEAgaW50IGRyYmRfc2VuZF9zaXplcyhzdHJ1Y3QgZHJi
ZF9wZWVyX2RldmljZSAqcGVlcl9kZXZpY2UsIGludCB0cmlnZ2VyX3JlcGx5LCBlbnUKIAogCW1l
bXNldChwLCAwLCBwYWNrZXRfc2l6ZSk7CiAJaWYgKGdldF9sZGV2X2lmX3N0YXRlKGRldmljZSwg
RF9ORUdPVElBVElORykpIHsKLQkJc3RydWN0IHJlcXVlc3RfcXVldWUgKnEgPSBiZGV2X2dldF9x
dWV1ZShkZXZpY2UtPmxkZXYtPmJhY2tpbmdfYmRldik7CisJCXN0cnVjdCBibG9ja19kZXZpY2Ug
KmJkZXYgPSBkZXZpY2UtPmxkZXYtPmJhY2tpbmdfYmRldjsKKwkJc3RydWN0IHJlcXVlc3RfcXVl
dWUgKnEgPSBiZGV2X2dldF9xdWV1ZShiZGV2KTsKKwogCQlkX3NpemUgPSBkcmJkX2dldF9tYXhf
Y2FwYWNpdHkoZGV2aWNlLT5sZGV2KTsKIAkJcmN1X3JlYWRfbG9jaygpOwogCQl1X3NpemUgPSBy
Y3VfZGVyZWZlcmVuY2UoZGV2aWNlLT5sZGV2LT5kaXNrX2NvbmYpLT5kaXNrX3NpemU7CkBAIC05
MzMsMTMgKzkzNSwxMyBAQCBpbnQgZHJiZF9zZW5kX3NpemVzKHN0cnVjdCBkcmJkX3BlZXJfZGV2
aWNlICpwZWVyX2RldmljZSwgaW50IHRyaWdnZXJfcmVwbHksIGVudQogCQltYXhfYmlvX3NpemUg
PSBxdWV1ZV9tYXhfaHdfc2VjdG9ycyhxKSA8PCA5OwogCQltYXhfYmlvX3NpemUgPSBtaW4obWF4
X2Jpb19zaXplLCBEUkJEX01BWF9CSU9fU0laRSk7CiAJCXAtPnFsaW0tPnBoeXNpY2FsX2Jsb2Nr
X3NpemUgPQotCQkJY3B1X3RvX2JlMzIocXVldWVfcGh5c2ljYWxfYmxvY2tfc2l6ZShxKSk7CisJ
CQljcHVfdG9fYmUzMihiZGV2X3BoeXNpY2FsX2Jsb2NrX3NpemUoYmRldikpOwogCQlwLT5xbGlt
LT5sb2dpY2FsX2Jsb2NrX3NpemUgPQotCQkJY3B1X3RvX2JlMzIocXVldWVfbG9naWNhbF9ibG9j
a19zaXplKHEpKTsKKwkJCWNwdV90b19iZTMyKGJkZXZfbG9naWNhbF9ibG9ja19zaXplKGJkZXYp
KTsKIAkJcC0+cWxpbS0+YWxpZ25tZW50X29mZnNldCA9CiAJCQljcHVfdG9fYmUzMihxdWV1ZV9h
bGlnbm1lbnRfb2Zmc2V0KHEpKTsKLQkJcC0+cWxpbS0+aW9fbWluID0gY3B1X3RvX2JlMzIocXVl
dWVfaW9fbWluKHEpKTsKLQkJcC0+cWxpbS0+aW9fb3B0ID0gY3B1X3RvX2JlMzIocXVldWVfaW9f
b3B0KHEpKTsKKwkJcC0+cWxpbS0+aW9fbWluID0gY3B1X3RvX2JlMzIoYmRldl9pb19taW4oYmRl
dikpOworCQlwLT5xbGltLT5pb19vcHQgPSBjcHVfdG9fYmUzMihiZGV2X2lvX29wdChiZGV2KSk7
CiAJCXAtPnFsaW0tPmRpc2NhcmRfZW5hYmxlZCA9IGJsa19xdWV1ZV9kaXNjYXJkKHEpOwogCQlw
dXRfbGRldihkZXZpY2UpOwogCX0gZWxzZSB7Ci0tIAoyLjMwLjIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJk
LWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2RyYmQtZGV2Cg==

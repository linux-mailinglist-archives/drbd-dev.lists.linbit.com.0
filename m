Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F5C5021E4
	for <lists+drbd-dev@lfdr.de>; Fri, 15 Apr 2022 06:55:21 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 14C9F4205D4;
	Fri, 15 Apr 2022 06:55:21 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E72EE42006A
	for <drbd-dev@lists.linbit.com>; Fri, 15 Apr 2022 06:53:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=be5XRqr6FpD/xPCRROQj1WW79ZNoTG4VrTyORPZGjVE=;
	b=zfdoWKjLNg8/93VMXMR/8dmem+
	WdvS+5iIu6uir1zneoGsW/PVn5k5msDFRP3cNUjzgk48HwXHEWdbPPQegdyt6x56ivnd6KhVFEdRn
	raW2CONj2YH3bKud1GU1IPcR9v/j6pw0pUmG9drywqIdz4cTw9frqxiK8uJ0qudjT7ff4EmR2zNpd
	iXKlU7IflKK7BZ1vMlEvBpbCIpEVLMDJnliSIXYAubrng3TWL7OH99pGfDALzISzxUUJefgBXG3V5
	WlBB+jh7r7m3TcfVeysrxVV3wHeAvYOUUoaQFeOXr6OBj0iU6tL7PMj+sYlQjUaSSJXCl4UqBVXnS
	NdWcSxoQ==;
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfDxU-008Opj-8L; Fri, 15 Apr 2022 04:53:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 15 Apr 2022 06:52:35 +0200
Message-Id: <20220415045258.199825-5-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220415045258.199825-1-hch@lst.de>
References: <20220415045258.199825-1-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 04/27] drbd: remove assign_p_sizes_qlim
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

Rm9sZCBlYWNoIGJyYW5jaCBpbnRvIGl0cyBvbmx5IGNhbGxlci4KClNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgpBY2tlZC1ieTogQ2hyaXN0b3BoIELDtmhtd2Fs
ZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0LmNvbT4KLS0tCiBkcml2ZXJzL2Jsb2Nr
L2RyYmQvZHJiZF9tYWluLmMgfCA0NyArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jIGIvZHJpdmVycy9ibG9jay9k
cmJkL2RyYmRfbWFpbi5jCmluZGV4IDRiMGIyNWNjOTE2ZWUuLjM2NzcxNTIwNWM4NjAgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYworKysgYi9kcml2ZXJzL2Jsb2Nr
L2RyYmQvZHJiZF9tYWluLmMKQEAgLTkwMywzMSArOTAzLDYgQEAgdm9pZCBkcmJkX2dlbl9hbmRf
c2VuZF9zeW5jX3V1aWQoc3RydWN0IGRyYmRfcGVlcl9kZXZpY2UgKnBlZXJfZGV2aWNlKQogCX0K
IH0KIAotLyogY29tbXVuaWNhdGVkIGlmIChhZ3JlZWRfZmVhdHVyZXMgJiBEUkJEX0ZGX1dTQU1F
KSAqLwotc3RhdGljIHZvaWQKLWFzc2lnbl9wX3NpemVzX3FsaW0oc3RydWN0IGRyYmRfZGV2aWNl
ICpkZXZpY2UsIHN0cnVjdCBwX3NpemVzICpwLAotCQkJCQlzdHJ1Y3QgcmVxdWVzdF9xdWV1ZSAq
cSkKLXsKLQlpZiAocSkgewotCQlwLT5xbGltLT5waHlzaWNhbF9ibG9ja19zaXplID0gY3B1X3Rv
X2JlMzIocXVldWVfcGh5c2ljYWxfYmxvY2tfc2l6ZShxKSk7Ci0JCXAtPnFsaW0tPmxvZ2ljYWxf
YmxvY2tfc2l6ZSA9IGNwdV90b19iZTMyKHF1ZXVlX2xvZ2ljYWxfYmxvY2tfc2l6ZShxKSk7Ci0J
CXAtPnFsaW0tPmFsaWdubWVudF9vZmZzZXQgPSBjcHVfdG9fYmUzMihxdWV1ZV9hbGlnbm1lbnRf
b2Zmc2V0KHEpKTsKLQkJcC0+cWxpbS0+aW9fbWluID0gY3B1X3RvX2JlMzIocXVldWVfaW9fbWlu
KHEpKTsKLQkJcC0+cWxpbS0+aW9fb3B0ID0gY3B1X3RvX2JlMzIocXVldWVfaW9fb3B0KHEpKTsK
LQkJcC0+cWxpbS0+ZGlzY2FyZF9lbmFibGVkID0gYmxrX3F1ZXVlX2Rpc2NhcmQocSk7Ci0JCXAt
PnFsaW0tPndyaXRlX3NhbWVfY2FwYWJsZSA9IDA7Ci0JfSBlbHNlIHsKLQkJcSA9IGRldmljZS0+
cnFfcXVldWU7Ci0JCXAtPnFsaW0tPnBoeXNpY2FsX2Jsb2NrX3NpemUgPSBjcHVfdG9fYmUzMihx
dWV1ZV9waHlzaWNhbF9ibG9ja19zaXplKHEpKTsKLQkJcC0+cWxpbS0+bG9naWNhbF9ibG9ja19z
aXplID0gY3B1X3RvX2JlMzIocXVldWVfbG9naWNhbF9ibG9ja19zaXplKHEpKTsKLQkJcC0+cWxp
bS0+YWxpZ25tZW50X29mZnNldCA9IDA7Ci0JCXAtPnFsaW0tPmlvX21pbiA9IGNwdV90b19iZTMy
KHF1ZXVlX2lvX21pbihxKSk7Ci0JCXAtPnFsaW0tPmlvX29wdCA9IGNwdV90b19iZTMyKHF1ZXVl
X2lvX29wdChxKSk7Ci0JCXAtPnFsaW0tPmRpc2NhcmRfZW5hYmxlZCA9IDA7Ci0JCXAtPnFsaW0t
PndyaXRlX3NhbWVfY2FwYWJsZSA9IDA7Ci0JfQotfQotCiBpbnQgZHJiZF9zZW5kX3NpemVzKHN0
cnVjdCBkcmJkX3BlZXJfZGV2aWNlICpwZWVyX2RldmljZSwgaW50IHRyaWdnZXJfcmVwbHksIGVu
dW0gZGRzX2ZsYWdzIGZsYWdzKQogewogCXN0cnVjdCBkcmJkX2RldmljZSAqZGV2aWNlID0gcGVl
cl9kZXZpY2UtPmRldmljZTsKQEAgLTk1NywxNCArOTMyLDMyIEBAIGludCBkcmJkX3NlbmRfc2l6
ZXMoc3RydWN0IGRyYmRfcGVlcl9kZXZpY2UgKnBlZXJfZGV2aWNlLCBpbnQgdHJpZ2dlcl9yZXBs
eSwgZW51CiAJCXFfb3JkZXJfdHlwZSA9IGRyYmRfcXVldWVfb3JkZXJfdHlwZShkZXZpY2UpOwog
CQltYXhfYmlvX3NpemUgPSBxdWV1ZV9tYXhfaHdfc2VjdG9ycyhxKSA8PCA5OwogCQltYXhfYmlv
X3NpemUgPSBtaW4obWF4X2Jpb19zaXplLCBEUkJEX01BWF9CSU9fU0laRSk7Ci0JCWFzc2lnbl9w
X3NpemVzX3FsaW0oZGV2aWNlLCBwLCBxKTsKKwkJcC0+cWxpbS0+cGh5c2ljYWxfYmxvY2tfc2l6
ZSA9CisJCQljcHVfdG9fYmUzMihxdWV1ZV9waHlzaWNhbF9ibG9ja19zaXplKHEpKTsKKwkJcC0+
cWxpbS0+bG9naWNhbF9ibG9ja19zaXplID0KKwkJCWNwdV90b19iZTMyKHF1ZXVlX2xvZ2ljYWxf
YmxvY2tfc2l6ZShxKSk7CisJCXAtPnFsaW0tPmFsaWdubWVudF9vZmZzZXQgPQorCQkJY3B1X3Rv
X2JlMzIocXVldWVfYWxpZ25tZW50X29mZnNldChxKSk7CisJCXAtPnFsaW0tPmlvX21pbiA9IGNw
dV90b19iZTMyKHF1ZXVlX2lvX21pbihxKSk7CisJCXAtPnFsaW0tPmlvX29wdCA9IGNwdV90b19i
ZTMyKHF1ZXVlX2lvX29wdChxKSk7CisJCXAtPnFsaW0tPmRpc2NhcmRfZW5hYmxlZCA9IGJsa19x
dWV1ZV9kaXNjYXJkKHEpOwogCQlwdXRfbGRldihkZXZpY2UpOwogCX0gZWxzZSB7CisJCXN0cnVj
dCByZXF1ZXN0X3F1ZXVlICpxID0gZGV2aWNlLT5ycV9xdWV1ZTsKKworCQlwLT5xbGltLT5waHlz
aWNhbF9ibG9ja19zaXplID0KKwkJCWNwdV90b19iZTMyKHF1ZXVlX3BoeXNpY2FsX2Jsb2NrX3Np
emUocSkpOworCQlwLT5xbGltLT5sb2dpY2FsX2Jsb2NrX3NpemUgPQorCQkJY3B1X3RvX2JlMzIo
cXVldWVfbG9naWNhbF9ibG9ja19zaXplKHEpKTsKKwkJcC0+cWxpbS0+YWxpZ25tZW50X29mZnNl
dCA9IDA7CisJCXAtPnFsaW0tPmlvX21pbiA9IGNwdV90b19iZTMyKHF1ZXVlX2lvX21pbihxKSk7
CisJCXAtPnFsaW0tPmlvX29wdCA9IGNwdV90b19iZTMyKHF1ZXVlX2lvX29wdChxKSk7CisJCXAt
PnFsaW0tPmRpc2NhcmRfZW5hYmxlZCA9IDA7CisKIAkJZF9zaXplID0gMDsKIAkJdV9zaXplID0g
MDsKIAkJcV9vcmRlcl90eXBlID0gUVVFVUVfT1JERVJFRF9OT05FOwogCQltYXhfYmlvX3NpemUg
PSBEUkJEX01BWF9CSU9fU0laRTsgLyogLi4uIG11bHRpcGxlIEJJT3MgcGVyIHBlZXJfcmVxdWVz
dCAqLwotCQlhc3NpZ25fcF9zaXplc19xbGltKGRldmljZSwgcCwgTlVMTCk7CiAJfQogCiAJaWYg
KHBlZXJfZGV2aWNlLT5jb25uZWN0aW9uLT5hZ3JlZWRfcHJvX3ZlcnNpb24gPD0gOTQpCi0tIAoy
LjMwLjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
YmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlz
dHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==

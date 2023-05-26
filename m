Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDBC71210F
	for <lists+drbd-dev@lfdr.de>; Fri, 26 May 2023 09:34:48 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C30D74252E7;
	Fri, 26 May 2023 09:34:48 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 56CC4420AFD
	for <drbd-dev@lists.linbit.com>; Fri, 26 May 2023 09:33:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=RQzHrIRCFqHArqIrnKCyvyHklB4zdcXT4MP2qOnLDko=;
	b=xIU9TLdnNYizB06PmvtzYlTdR5
	HlTQdpKGeyyWACTTR95smi75XqDqgG9cDCVGjAOdZdR3m8BPT3TY8BNggYNMWsvJTYAI3fPk8ZdnX
	+BPgRSFHUYMlBkhvzll8T3HI/Xl9csNmtX8QKMKtP/iRaIPqnstKYFRv4S7XfWPyCylLC1KlvR72z
	xZm4OyGRiK0FlBL7bEZCD6oegED5VqaXt1eqNzYb6Rc3bdAejGjBTYfmdB5Mdvz6UDPn/5p642Nn9
	5WC3HcP4OrbSccmqITnp/WDQKvQYcQr/4mAHruC7ragwNbVz4FX6+BYEFG0dF9uA91YTcz/4vzB+7
	v43VXK/A==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
	Hat Linux)) id 1q2RxB-001RdT-0G; Fri, 26 May 2023 07:33:37 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com, hch@infradead.org, djwong@kernel.org,
	minchan@kernel.org, senozhatsky@chromium.org
Date: Fri, 26 May 2023 00:33:33 -0700
Message-Id: <20230526073336.344543-3-mcgrof@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230526073336.344543-1-mcgrof@kernel.org>
References: <20230526073336.344543-1-mcgrof@kernel.org>
MIME-Version: 1.0
Cc: p.raghav@samsung.com, linux-xfs@vger.kernel.org, rohan.puri@samsung.com,
	da.gomez@samsung.com, mcgrof@kernel.org, patches@lists.linux.dev,
	willy@infradead.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, hare@suse.de, linux-fsdevel@vger.kernel.org,
	rpuri.linux@gmail.com, kbusch@kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 2/5] drbd: use PAGE_SECTORS_SHIFT and
	PAGE_SECTORS
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

UmVwbGFjZSBjb21tb24gY29uc3RhbnRzIHdpdGggZ2VuZXJpYyB2ZXJzaW9ucy4KVGhpcyBwcm9k
dWNlcyBubyBmdW5jdGlvbmFsIGNoYW5nZXMuCgpBY2tlZC1ieTogQ2hyaXN0b3BoIELDtmhtd2Fs
ZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0LmNvbT4KU2lnbmVkLW9mZi1ieTogTHVp
cyBDaGFtYmVybGFpbiA8bWNncm9mQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ibG9jay9kcmJk
L2RyYmRfYml0bWFwLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfYml0
bWFwLmMgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9iaXRtYXAuYwppbmRleCA2YWM4YzU0YjQ0
YzcuLmI1NTZlNjYzNGYxMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfYml0
bWFwLmMKKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfYml0bWFwLmMKQEAgLTEwMDAsNyAr
MTAwMCw3IEBAIHN0YXRpYyB2b2lkIGJtX3BhZ2VfaW9fYXN5bmMoc3RydWN0IGRyYmRfYm1fYWlv
X2N0eCAqY3R4LCBpbnQgcGFnZV9ucikgX19tdXN0X2hvCiAJdW5zaWduZWQgaW50IGxlbjsKIAog
CWZpcnN0X2JtX3NlY3QgPSBkZXZpY2UtPmxkZXYtPm1kLm1kX29mZnNldCArIGRldmljZS0+bGRl
di0+bWQuYm1fb2Zmc2V0OwotCW9uX2Rpc2tfc2VjdG9yID0gZmlyc3RfYm1fc2VjdCArICgoKHNl
Y3Rvcl90KXBhZ2VfbnIpIDw8IChQQUdFX1NISUZULVNFQ1RPUl9TSElGVCkpOworCW9uX2Rpc2tf
c2VjdG9yID0gZmlyc3RfYm1fc2VjdCArICgoKHNlY3Rvcl90KXBhZ2VfbnIpIDw8IFBBR0VfU0VD
VE9SU19TSElGVCk7CiAKIAkvKiB0aGlzIG1pZ2h0IGhhcHBlbiB3aXRoIHZlcnkgc21hbGwKIAkg
KiBmbGV4aWJsZSBleHRlcm5hbCBtZXRhIGRhdGEgZGV2aWNlLApAQCAtMTAwOCw3ICsxMDA4LDcg
QEAgc3RhdGljIHZvaWQgYm1fcGFnZV9pb19hc3luYyhzdHJ1Y3QgZHJiZF9ibV9haW9fY3R4ICpj
dHgsIGludCBwYWdlX25yKSBfX211c3RfaG8KIAlsYXN0X2JtX3NlY3QgPSBkcmJkX21kX2xhc3Rf
Yml0bWFwX3NlY3RvcihkZXZpY2UtPmxkZXYpOwogCWlmIChmaXJzdF9ibV9zZWN0IDw9IG9uX2Rp
c2tfc2VjdG9yICYmIGxhc3RfYm1fc2VjdCA+PSBvbl9kaXNrX3NlY3RvcikgewogCQlzZWN0b3Jf
dCBsZW5fc2VjdCA9IGxhc3RfYm1fc2VjdCAtIG9uX2Rpc2tfc2VjdG9yICsgMTsKLQkJaWYgKGxl
bl9zZWN0IDwgUEFHRV9TSVpFL1NFQ1RPUl9TSVpFKQorCQlpZiAobGVuX3NlY3QgPCBQQUdFX1NF
Q1RPUlMpCiAJCQlsZW4gPSAodW5zaWduZWQgaW50KWxlbl9zZWN0KlNFQ1RPUl9TSVpFOwogCQll
bHNlCiAJCQlsZW4gPSBQQUdFX1NJWkU7Ci0tIAoyLjM5LjIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRl
dkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2RyYmQtZGV2Cg==

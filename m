Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 460194FA8F4
	for <lists+drbd-dev@lfdr.de>; Sat,  9 Apr 2022 16:33:10 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0F217420FC1;
	Sat,  9 Apr 2022 16:33:09 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A9398420FBE
	for <drbd-dev@lists.linbit.com>; Sat,  9 Apr 2022 16:33:06 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 207A11F864;
	Sat,  9 Apr 2022 14:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1649514786;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=BmOfl4NqddautzOtQrZ0dLuhiQSp1fB0SDxF8v7gYBA=;
	b=SJlQufjnXjTQtqgkhM6MsOUPDPwOMZ6xGLQ76UNS6RR1cEGIg2CW/GZ7A0Nq9xE2LKzjCQ
	zm4gbJFRwGS5ZR58/OOlzltxzH57NlfDQ1MS9kgXiNk7elM8N3NSClk0AEwvrheO6NCJzw
	l51uuNG8cURr+Q1l6/il4XbIWcEO2Fg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1649514786;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=BmOfl4NqddautzOtQrZ0dLuhiQSp1fB0SDxF8v7gYBA=;
	b=yiH+qx8I6hbeCP31rtrhbZE5qxMo8OqYiXG+UWOpJ9wghAOQqadl62X34RS7V0fnDyonaX
	HzX10h1d2uotqQBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3F41913AA1;
	Sat,  9 Apr 2022 14:32:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id m2GpARiZUWLHIgAAMHmgww
	(envelope-from <colyli@suse.de>); Sat, 09 Apr 2022 14:32:56 +0000
Message-ID: <f01ac878-9b0d-972b-70dc-6f3f61b9947b@suse.de>
Date: Sat, 9 Apr 2022 22:32:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.7.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20220409045043.23593-1-hch@lst.de>
	<20220409045043.23593-27-hch@lst.de>
From: Coly Li <colyli@suse.de>
In-Reply-To: <20220409045043.23593-27-hch@lst.de>
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org,
	linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
	xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
	linux-um@lists.infradead.org, nbd@other.debian.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	David Sterba <dsterba@suse.com>, ceph-devel@vger.kernel.org,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 26/27] block: decouple REQ_OP_SECURE_ERASE
 from REQ_OP_DISCARD
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

T24gNC85LzIyIDEyOjUwIFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBTZWN1cmUgZXJh
c2UgaXMgYSB2ZXJ5IGRpZmZlcmVudCBvcGVyYXRpb24gZnJvbSBkaXNjYXJkIGluIHRoYXQgaXQg
aXMKPiBhIGRhdGEgaW50ZWdyaXR5IG9wZXJhdGlvbiB2cyBoaW50LiAgRnVsbHkgc3BsaXQgdGhl
IGxpbWl0cyBhbmQgaGVscGVyCj4gaW5mcmFzdHJ1Y3R1cmUgdG8gbWFrZSB0aGUgc2VwYXJhdGlv
biBtb3JlIGNsZWFyLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+Cj4gUmV2aWV3ZWQtYnk6IE1hcnRpbiBLLiBQZXRlcnNlbiA8bWFydGluLnBldGVyc2Vu
QG9yYWNsZS5jb20+Cj4gQWNrZWQtYnk6IENocmlzdG9waCBCw7ZobXdhbGRlciA8Y2hyaXN0b3Bo
LmJvZWhtd2FsZGVyQGxpbmJpdC5jb20+IFtkcmJkXQo+IEFja2VkLWJ5OiBSeXVzdWtlIEtvbmlz
aGkgPGtvbmlzaGkucnl1c3VrZUBnbWFpbC5jb20+IFtuaWZzMl0KPiBBY2tlZC1ieTogQ29seSBM
aSA8Y29seWxpQHN1c2UuZGU+IFtkcmJkXQoKSGkgQ2hyaXN0b3BoLAoKTXkgQUNLIGlzIGZvciBi
Y2FjaGUsIG5vdCBkcmJkIGhlcmUuCgpUaGFua3MuCgoKQ29seSBMaQoKCgo+IEFja2VkLWJ5OiBE
YXZpZCBTdGVyYmEgPGRzdGVyYmFAc3VzZS5jb20+IFtidHJmc10KCgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QK
ZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1h
bi9saXN0aW5mby9kcmJkLWRldgo=

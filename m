Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E04149F03E
	for <lists+drbd-dev@lfdr.de>; Fri, 28 Jan 2022 01:59:02 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 019A542A588;
	Fri, 28 Jan 2022 01:59:01 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
	[209.85.166.48])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6BA1B42A582
	for <drbd-dev@lists.linbit.com>; Fri, 28 Jan 2022 01:58:59 +0100 (CET)
Received: by mail-io1-f48.google.com with SMTP id z199so5863670iof.10
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 16:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=OnqrK1B7nE7jhPSJbx7uJGsFsnzMH0p8PmdMrmsnx7c=;
	b=eiqFDzffYRJHxrlhdAhplyWNbDu7+9XCywnSXd70CEjIhMS+QILhU1gn2PxLfmnCZT
	bNJ9Uu6Wc0dwdvneqYk7j+Gx1rRovjfECn7zCQ0xWiL4H6hvX9A8b5oKYyqce02E7DCW
	NTzQ49F7FCqba9EG78FvWG2FJ0q8GVrQIyWy2fIDxxDCLv3njcQzyLih4s1aXLOz0i+/
	5sSTGgzeA0gu4w3dPuF1jSpGKYFT3eqFqlPbp/g33aBBagrayGA8ak+IubpG+AiehtbE
	3dsYzg7w2/MbCg9ctg4WDF1ndwIhh6gr6Vd+Zl57wcQBRUaLrzVSaK25RiFiy+diDvja
	JVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=OnqrK1B7nE7jhPSJbx7uJGsFsnzMH0p8PmdMrmsnx7c=;
	b=L16JRp2eQCrW0tyHnho46breb1lNlL/G2aJfmVaZwzNK6wxrfrpRhJxdDr6GDC3fWg
	Fc6CJno6uDR0kqXE8x0x1L3DsfA2Q8eJt9EKhkb6yXxgS/3qmUMzXiG9B4/lsGZEFmlv
	KhhjZsqpG+0de9u61CaaDbt9AqDWS3wrWvlOSD0iyHY4cZ6m5B5a7olF/dwh3ii52gjn
	dMipkVgAQvC8UfuC132+f3F1kiaf6OonQ34///fBvgMmYsxcKu6ezEBnWcv1HCBrv6Q1
	NIoey4yRIb2wBhVOvz+vk+kgnxSgItU/dgP7KoVB9GwmfEgWoKVu2n5I0GJ4lbX8Mcp+
	Oztg==
X-Gm-Message-State: AOAM531RvgxDYh2SSxMNprZASQ9AeHb9UtK3rbVvZfuJqII4XpUp28yJ
	Tm4AMqRxZyXAkoJ+yBzqojhYRw==
X-Google-Smtp-Source: ABdhPJwV/AEHiSXVQGFEZXPZwOlZ61Jpa3Td0l0CjC3IrFA3/SuJ9toHc9iJFAxn2WQdRiu2+bdIdQ==
X-Received: by 2002:a02:84ef:: with SMTP id f102mr3301483jai.25.1643331538286; 
	Thu, 27 Jan 2022 16:58:58 -0800 (PST)
Received: from [192.168.1.116] ([66.219.217.159])
	by smtp.gmail.com with ESMTPSA id
	m4sm12789023iln.48.2022.01.27.16.58.56
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 27 Jan 2022 16:58:57 -0800 (PST)
To: NeilBrown <neilb@suse.de>, Andrew Morton <akpm@linux-foundation.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Paolo Valente <paolo.valente@linaro.org>
References: <164325106958.29787.4865219843242892726.stgit@noble.brown>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <2e721a70-bc57-0894-9d76-34a9d58c0cb7@kernel.dk>
Date: Thu, 27 Jan 2022 17:58:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <164325106958.29787.4865219843242892726.stgit@noble.brown>
Content-Language: en-US
Cc: linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-ext4@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 0/9] Remove remaining parts of congestions
	tracking code.
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

On 1/26/22 7:46 PM, NeilBrown wrote:
> Congestion hasn't been reliably tracked for quite some time.
> Most MM uses of it for guiding writeback decisions were removed in 5.16.
> Some other uses were removed in 17-rc1.
> 
> This series removes the remaining places that test for congestion, and
> the few places which still set it.
> 
> The second patch touches a few filesystems.  I didn't think there was
> much value in splitting this out by filesystems, but if maintainers
> would rather I did that, I will.
> 
> The f2fs, cephfs, fuse, NFS, and block patches can go through the
> respective trees proving the final patch doesn't land until after they
> all do - so maybe it should be held for 5.18-rc2 if all the rest lands
> by 5.18-rc1.

For the series:

Acked-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
